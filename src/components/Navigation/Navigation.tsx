import { useState } from 'react';
import './Navigation.css';

type NavItem = {
  id: string;
  label: string;
  href: string;
  ariaLabel?: string;
};

type Props = {
  items: NavItem[];
  brand: { title: string; href?: string };
};

export default function Navigation({ items, brand }: Props) {
  const [open, setOpen] = useState(false);

  return (
    <nav className="nav" role="navigation" aria-label="Primary">
      {/* Docs: See specs/007-responsive-layout-foundation/spec.md and contracts/navigation.md */}
      <div className="nav__brand">
        <a href={brand.href || '/'}>{brand.title}</a>
      </div>
      <button
        className="nav__toggle"
        aria-expanded={open}
        aria-label={open ? 'Close menu' : 'Open menu'}
        onClick={() => setOpen(!open)}
      >
        ☰
      </button>
      <ul className={`nav__list ${open ? 'nav__list--open' : ''}`}>
        {items.map((it) => (
          <li key={it.id} className="nav__item">
            <a href={it.href} aria-label={it.ariaLabel || it.label}>
              {it.label}
            </a>
          </li>
        ))}
      </ul>
    </nav>
  );
}
