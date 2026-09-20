const fs = require('fs');
const path = require('path');

function hexToRgb(hex) {
  if (!hex) return null;
  hex = hex.replace('#', '');
  if (hex.length === 3) {
    hex = hex.split('').map(c => c + c).join('');
  }
  const num = parseInt(hex, 16);
  return { r: (num >> 16) & 255, g: (num >> 8) & 255, b: num & 255 };
}

function sRGBtoLinear(v) {
  v = v / 255;
  return v <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
}

function luminance(rgb) {
  const r = sRGBtoLinear(rgb.r);
  const g = sRGBtoLinear(rgb.g);
  const b = sRGBtoLinear(rgb.b);
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

function contrastRatio(rgb1, rgb2) {
  const L1 = luminance(rgb1);
  const L2 = luminance(rgb2);
  const lighter = Math.max(L1, L2);
  const darker = Math.min(L1, L2);
  return (lighter + 0.05) / (darker + 0.05);
}

const tokensPath = path.join(__dirname, '..', 'src', 'styles', 'design-tokens.css');
const css = fs.readFileSync(tokensPath, 'utf8');

const varRegex = /--([a-z0-9-]+)\s*:\s*([^;\n]+);/gi;
let match;
const tokens = {};
while ((match = varRegex.exec(css)) !== null) {
  tokens[match[1]] = match[2].trim();
}

function parseColor(val) {
  const hex = (val.match(/#([0-9a-fA-F]{3,6})/) || [])[0];
  if (hex) return hexToRgb(hex);
  const rgbMatch = val.match(/rgb\s*\(\s*(\d+),\s*(\d+),\s*(\d+)\s*\)/i);
  if (rgbMatch) return { r: +rgbMatch[1], g: +rgbMatch[2], b: +rgbMatch[3] };
  return null;
}

const backgroundCandidates = ['color-neutral-100'];
const foregroundKeys = Object.keys(tokens).filter(k => k.startsWith('color-'));

const results = [];
for (const fg of foregroundKeys) {
  const fgColor = parseColor(tokens[fg]);
  if (!fgColor) continue;
  for (const bgKey of backgroundCandidates) {
    if (!tokens[bgKey]) continue;
    const bgColor = parseColor(tokens[bgKey]);
    if (!bgColor) continue;
    const ratio = contrastRatio(fgColor, bgColor);
    results.push({ fg, bg: bgKey, ratio: Number(ratio.toFixed(2)) });
  }
}

const out = { generated: new Date().toISOString(), results };
console.log(JSON.stringify(out, null, 2));

const accPath = path.join(__dirname, '..', 'specs', '007-visual-design-system', 'accessibility.md');
let acc = fs.readFileSync(accPath, 'utf8');
acc += '\n\n## Automated contrast-check results\n\n';
for (const r of results) {
  acc += `- ${r.fg} vs ${r.bg}: contrast ratio ${r.ratio} \n`;
}
fs.writeFileSync(accPath, acc, 'utf8');

process.exit(0);
