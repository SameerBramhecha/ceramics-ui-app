import React from 'react';
import '../PageShell/PageShell.css';
import Navigation from '../Navigation/Navigation';

type Props = {
  children: React.ReactNode;
};

export default function PageShell({ children }: Props) {
  const navItems = [
    { id: 'home', label: 'Home', href: '/' },
    { id: 'about', label: 'About', href: '/about' },
    { id: 'gallery', label: 'Gallery', href: '/gallery' },
    { id: 'contact', label: 'Contact', href: '/contact' },
  ];

  return (
    <div className="page-shell">
      {/* Docs: See specs/007-responsive-layout-foundation/spec.md and contracts/navigation.md */}
      <header className="page-shell__header">
        <div className="brand">
          <a href="/">Bramhecha Ceramics</a>
        </div>
        <Navigation items={navItems} brand={{ title: 'Bramhecha Ceramics', href: '/' }} />
      </header>

      <main className="page-shell__main">{children}</main>

      <footer className="page-shell__footer">© Bramhecha Ceramics</footer>
    </div>
  );
}
