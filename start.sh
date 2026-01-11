#!/bin/bash

# Create all files at once
cat > package.json << 'EOF'
{
  "name": "ytcraft-indonesia",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "lucide-react": "^0.263.1"
  },
  "devDependencies": {
    "@types/node": "^20.0.0",
    "@types/react": "^18.2.0",
    "@types/react-dom": "^18.2.0",
    "autoprefixer": "^10.0.0",
    "postcss": "^8.0.0",
    "tailwindcss": "^3.3.0",
    "typescript": "^5.0.0",
    "eslint": "^8.0.0",
    "eslint-config-next": "^14.0.0"
  }
}
EOF

# ========== CONFIGURATION FILES ==========
cat > tailwind.config.ts << 'EOF'
import type { Config } from 'tailwindcss'

const config: Config = {
  darkMode: 'class',
  content: [
    './pages/**/*.{ts,tsx}',
    './components/**/*.{ts,tsx}',
    './app/**/*.{ts,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#f0fdfa',
          100: '#ccfbf1',
          200: '#99f6e4',
          300: '#5eead4',
          400: '#2dd4bf',
          500: '#14b8a6',
          600: '#0d9488',
          700: '#0f766e',
          800: '#115e59',
          900: '#134e4a',
        },
        dark: {
          bg: '#0a1929',
          surface: '#132f4c',
          text: '#e6f1ff',
        },
        light: {
          bg: '#ffffff',
          surface: '#f8fafc',
          text: '#1e293b',
        }
      },
      fontFamily: {
        sans: ['var(--font-inter)', 'system-ui', 'sans-serif'],
        heading: ['var(--font-plus-jakarta-sans)', 'system-ui', 'sans-serif'],
      },
      animation: {
        'fade-in': 'fadeIn 0.5s ease-in-out',
        'slide-up': 'slideUp 0.3s ease-out',
        'float': 'float 3s ease-in-out infinite',
        'pulse-slow': 'pulse 3s ease-in-out infinite',
        'spin-slow': 'spin 3s linear infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { transform: 'translateY(10px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' },
        },
        float: {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-10px)' },
        },
      },
    },
  },
  plugins: [],
}

export default config
EOF

cat > postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ['images.unsplash.com'],
  },
}

module.exports = nextConfig
EOF

cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
EOF

# ========== STYLES ==========
cat > styles/globals.css << 'EOF'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --primary: #14b8a6;
    --primary-dark: #0d9488;
    --dark-bg: #0a1929;
    --dark-surface: #132f4c;
    --light-bg: #ffffff;
    --light-surface: #f8fafc;
  }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  html {
    scroll-behavior: smooth;
  }

  body {
    @apply bg-light-bg text-light-text dark:bg-dark-bg dark:text-dark-text transition-colors duration-300;
    font-family: 'Inter', sans-serif;
    overflow-x: hidden;
  }

  h1, h2, h3, h4, h5, h6 {
    font-family: 'Plus Jakarta Sans', sans-serif;
    @apply font-bold tracking-tight;
  }
}

@layer components {
  .container-custom {
    @apply max-w-7xl mx-auto px-4 sm:px-6 lg:px-8;
  }

  .gradient-text {
    @apply bg-gradient-to-r from-primary-400 to-primary-600 bg-clip-text text-transparent;
  }

  .card-hover {
    @apply transition-all duration-300 hover:scale-[1.02] hover:shadow-xl;
  }

  .section-padding {
    @apply py-12 md:py-20 lg:py-24;
  }

  .glass-effect {
    @apply bg-white/10 dark:bg-white/5 backdrop-blur-md border border-white/20;
  }
}
EOF

# ========== TYPES ==========
cat > types/index.ts << 'EOF'
export interface Article {
  id: string;
  slug: string;
  title: string;
  excerpt: string;
  content: string;
  author: string;
  date: string;
  category: string;
  tags: string[];
  readTime: string;
  imageUrl: string;
}

export interface Service {
  id: string;
  title: string;
  description: string;
  icon: string;
  features: string[];
}

export interface Product {
  id: string;
  name: string;
  category: 'digital' | 'physical' | 'game';
  description: string;
  price?: string;
  features: string[];
  imageUrl: string;
}

export interface PortfolioItem {
  id: string;
  title: string;
  category: string;
  description: string;
  imageUrl: string;
  client: string;
  year: string;
}
EOF

# ========== DATA ==========
cat > data/articles.ts << 'EOF'
import { Article } from '@/types';

export const articles: Article[] = [
  {
    id: '1',
    slug: 'teknologi-industri-4.0',
    title: 'Transformasi Digital: Menerapkan Industry 4.0 di UMKM',
    excerpt: 'Bagaimana teknologi dapat membantu UMKM bertransformasi menuju era digital.',
    content: '<p>Dalam era digital saat ini, transformasi teknologi menjadi kunci kesuksesan bisnis...</p>',
    author: 'Tim YTCraft',
    date: '2024-01-15',
    category: 'Technology',
    tags: ['Digital Transformation', 'Industry 4.0', 'SME'],
    readTime: '5 min read',
    imageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=600&h=400&fit=crop',
  },
  {
    id: '2',
    slug: 'sustainable-technology',
    title: 'Teknologi Berkelanjutan untuk Masa Depan',
    excerpt: 'Inovasi teknologi yang mendukung keberlanjutan lingkungan.',
    content: '<p>Sustainability bukan lagi pilihan, melainkan kebutuhan...</p>',
    author: 'Dr. Aris Wijaya',
    date: '2024-01-10',
    category: 'Sustainability',
    tags: ['Green Tech', 'Sustainability', 'Innovation'],
    readTime: '4 min read',
    imageUrl: 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=600&h=400&fit=crop',
  },
  {
    id: '3',
    slug: 'iot-healthcare-solutions',
    title: 'Solusi IoT dalam Dunia Kesehatan Modern',
    excerpt: 'Penerapan Internet of Things untuk meningkatkan layanan kesehatan.',
    content: '<p>IoT membawa revolusi dalam dunia kesehatan...</p>',
    author: 'Sarah Chen',
    date: '2024-01-05',
    category: 'Healthcare',
    tags: ['IoT', 'Healthcare', 'Medical Tech'],
    readTime: '6 min read',
    imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=600&h=400&fit=crop',
  },
  {
    id: '4',
    slug: 'ai-business-automation',
    title: 'Otomatisasi Bisnis dengan Kecerdasan Buatan',
    excerpt: 'Bagaimana AI dapat mengoptimalkan operasional bisnis.',
    content: '<p>Artificial Intelligence telah menjadi game-changer...</p>',
    author: 'Michael Tan',
    date: '2023-12-20',
    category: 'AI',
    tags: ['Artificial Intelligence', 'Automation', 'Business'],
    readTime: '7 min read',
    imageUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=600&h=400&fit=crop',
  },
];
EOF

cat > data/services.ts << 'EOF'
import { Service } from '@/types';

export const services: Service[] = [
  {
    id: '1',
    title: 'Software & Digital Solution',
    description: 'Pengembangan software custom, aplikasi web/mobile, dan sistem digital untuk bisnis Anda.',
    icon: '💻',
    features: [
      'Custom Software Development',
      'Web & Mobile Apps',
      'Cloud Solutions',
      'Digital Transformation',
      'ERP & CRM Systems',
    ],
  },
  {
    id: '2',
    title: 'Elektronik & Mesin',
    description: 'Desain dan produksi komponen elektronik serta mesin custom sesuai kebutuhan.',
    icon: '⚡',
    features: [
      'PCB Design & Assembly',
      'Embedded Systems',
      'Custom Machinery',
      'Automation Systems',
      'IoT Devices',
    ],
  },
  {
    id: '3',
    title: 'Laboratorium & Kesehatan',
    description: 'Peralatan laboratorium dan solusi teknologi untuk sektor kesehatan.',
    icon: '🔬',
    features: [
      'Medical Equipment',
      'Lab Instruments',
      'Health Monitoring Systems',
      'Research Tools',
      'Diagnostic Devices',
    ],
  },
  {
    id: '4',
    title: 'Percetakan & Kerajinan',
    description: 'Produksi merchandise, packaging, dan produk kerajinan berkualitas tinggi.',
    icon: '🎨',
    features: [
      'Branded Merchandise',
      'Premium Packaging',
      'Custom Crafts',
      '3D Printing',
      'Laser Cutting',
    ],
  },
  {
    id: '5',
    title: 'Digital Product & Game',
    description: 'Pengembangan produk digital dan game untuk berbagai platform.',
    icon: '🎮',
    features: [
      'Game Development',
      'AR/VR Experiences',
      'Digital Assets',
      'Interactive Media',
      'Mobile Games',
    ],
  },
];
EOF

cat > data/products.ts << 'EOF'
import { Product } from '@/types';

export const products: Product[] = [
  {
    id: '1',
    name: 'Smart Health Monitor',
    category: 'physical',
    description: 'Perangkat monitoring kesehatan dengan IoT integration',
    price: 'Rp 2.500.000',
    features: ['Real-time monitoring', 'Cloud storage', 'Mobile app', 'Multi-parameter'],
    imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w-600&h=400&fit=crop',
  },
  {
    id: '2',
    name: 'Inventory Pro Software',
    category: 'digital',
    description: 'Sistem manajemen inventaris dengan AI prediction',
    price: 'Rp 15.000.000',
    features: ['AI prediction', 'Barcode system', 'Multi-warehouse', 'Real-time update'],
    imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600&h=400&fit=crop',
  },
  {
    id: '3',
    name: 'EcoGuard Game',
    category: 'game',
    description: 'Game edukasi lingkungan untuk anak-anak',
    price: 'Rp 89.000',
    features: ['Educational content', 'Multiplayer', 'Parental control', 'Regular updates'],
    imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=600&h=400&fit=crop',
  },
  {
    id: '4',
    name: 'Industrial IoT Gateway',
    category: 'physical',
    description: 'Gateway untuk sistem IoT industri',
    price: 'Rp 8.500.000',
    features: ['Multiple protocols', 'Edge computing', 'Secure connection', 'Scalable'],
    imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=400&fit=crop',
  },
];
EOF

# ========== COMPONENTS LAYOUT ==========
cat > components/layout/Navbar.tsx << 'EOF'
'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { Menu, X, Sun, Moon, ChevronDown } from 'lucide-react';

const navigation = [
  { name: 'Home', href: '/' },
  { name: 'About', href: '/about' },
  { name: 'Services', href: '/services' },
  { name: 'Products', href: '/products' },
  { name: 'Portfolio', href: '/portfolio' },
  { name: 'Articles', href: '/articles' },
  { name: 'Contact', href: '/contact' },
];

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const [darkMode, setDarkMode] = useState(false);
  const pathname = usePathname();

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  useEffect(() => {
    const isDark = localStorage.getItem('darkMode') === 'true';
    setDarkMode(isDark);
    if (isDark) {
      document.documentElement.classList.add('dark');
    }
  }, []);

  const toggleDarkMode = () => {
    const newDarkMode = !darkMode;
    setDarkMode(newDarkMode);
    localStorage.setItem('darkMode', String(newDarkMode));
    if (newDarkMode) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  };

  return (
    <nav
      className={`fixed w-full z-50 transition-all duration-300 ${
        scrolled
          ? 'bg-white/90 dark:bg-dark-surface/90 backdrop-blur-md shadow-lg'
          : 'bg-transparent'
      }`}
    >
      <div className="container-custom">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <Link href="/" className="flex items-center space-x-2">
            <div className="w-10 h-10 bg-gradient-to-br from-primary-500 to-primary-700 rounded-lg flex items-center justify-center">
              <span className="text-white font-bold text-lg">YTC</span>
            </div>
            <div>
              <h1 className="text-lg font-bold">YTCraft Indonesia</h1>
              <p className="text-xs text-gray-500 dark:text-gray-400">
                Crafting the Future with Technology
              </p>
            </div>
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center space-x-8">
            {navigation.map((item) => (
              <Link
                key={item.name}
                href={item.href}
                className={`text-sm font-medium transition-colors ${
                  pathname === item.href
                    ? 'text-primary-600 dark:text-primary-400'
                    : 'text-gray-700 dark:text-gray-300 hover:text-primary-600 dark:hover:text-primary-400'
                }`}
              >
                {item.name}
              </Link>
            ))}
          </div>

          {/* Right Side */}
          <div className="flex items-center space-x-4">
            {/* Dark Mode Toggle */}
            <button
              onClick={toggleDarkMode}
              className="p-2 rounded-lg bg-gray-100 dark:bg-dark-bg hover:bg-gray-200 dark:hover:bg-gray-800 transition-colors"
              aria-label="Toggle dark mode"
            >
              {darkMode ? (
                <Sun className="w-5 h-5 text-yellow-500" />
              ) : (
                <Moon className="w-5 h-5 text-gray-700" />
              )}
            </button>

            {/* Mobile Menu Button */}
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="md:hidden p-2 rounded-lg bg-gray-100 dark:bg-dark-bg hover:bg-gray-200 dark:hover:bg-gray-800"
              aria-label="Toggle menu"
            >
              {isOpen ? (
                <X className="w-6 h-6" />
              ) : (
                <Menu className="w-6 h-6" />
              )}
            </button>
          </div>
        </div>

        {/* Mobile Menu */}
        {isOpen && (
          <div className="md:hidden animate-slide-up">
            <div className="px-2 pt-2 pb-3 space-y-1 bg-white dark:bg-dark-surface rounded-lg shadow-lg mt-2">
              {navigation.map((item) => (
                <Link
                  key={item.name}
                  href={item.href}
                  onClick={() => setIsOpen(false)}
                  className={`block px-3 py-2 rounded-md text-base font-medium ${
                    pathname === item.href
                      ? 'bg-primary-50 dark:bg-primary-900/30 text-primary-600 dark:text-primary-400'
                      : 'text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-800'
                  }`}
                >
                  {item.name}
                </Link>
              ))}
            </div>
          </div>
        )}
      </div>
    </nav>
  );
}
EOF

cat > components/layout/Footer.tsx << 'EOF'
import Link from 'next/link';
import { Facebook, Instagram, Linkedin, Twitter, Mail, Phone, MapPin } from 'lucide-react';

export default function Footer() {
  const currentYear = new Date().getFullYear();

  return (
    <footer className="bg-gray-900 text-white">
      <div className="container-custom">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 py-12">
          {/* Company Info */}
          <div>
            <div className="flex items-center space-x-2 mb-4">
              <div className="w-10 h-10 bg-gradient-to-br from-primary-500 to-primary-700 rounded-lg flex items-center justify-center">
                <span className="text-white font-bold text-lg">YTC</span>
              </div>
              <div>
                <h2 className="text-lg font-bold">YTCraft Indonesia</h2>
                <p className="text-sm text-gray-400">Crafting the Future with Technology</p>
              </div>
            </div>
            <p className="text-gray-400 mb-6">
              Perusahaan teknologi inovatif yang berfokus pada pengembangan solusi digital dan produk fisik berkualitas tinggi.
            </p>
            <div className="flex space-x-4">
              <a href="#" className="text-gray-400 hover:text-primary-400 transition-colors">
                <Facebook className="w-5 h-5" />
              </a>
              <a href="#" className="text-gray-400 hover:text-primary-400 transition-colors">
                <Twitter className="w-5 h-5" />
              </a>
              <a href="#" className="text-gray-400 hover:text-primary-400 transition-colors">
                <Instagram className="w-5 h-5" />
              </a>
              <a href="#" className="text-gray-400 hover:text-primary-400 transition-colors">
                <Linkedin className="w-5 h-5" />
              </a>
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="text-lg font-bold mb-6">Quick Links</h3>
            <ul className="space-y-3">
              <li>
                <Link href="/about" className="text-gray-400 hover:text-primary-400 transition-colors">
                  About Us
                </Link>
              </li>
              <li>
                <Link href="/services" className="text-gray-400 hover:text-primary-400 transition-colors">
                  Our Services
                </Link>
              </li>
              <li>
                <Link href="/portfolio" className="text-gray-400 hover:text-primary-400 transition-colors">
                  Portfolio
                </Link>
              </li>
              <li>
                <Link href="/articles" className="text-gray-400 hover:text-primary-400 transition-colors">
                  Articles
                </Link>
              </li>
              <li>
                <Link href="/contact" className="text-gray-400 hover:text-primary-400 transition-colors">
                  Contact Us
                </Link>
              </li>
            </ul>
          </div>

          {/* Services */}
          <div>
            <h3 className="text-lg font-bold mb-6">Our Services</h3>
            <ul className="space-y-3">
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Software Development
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Electronics & Machinery
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Laboratory Equipment
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Printing & Crafts
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Digital Products
                </span>
              </li>
            </ul>
          </div>

          {/* Contact Info */}
          <div>
            <h3 className="text-lg font-bold mb-6">Contact Info</h3>
            <ul className="space-y-4">
              <li className="flex items-start space-x-3">
                <MapPin className="w-5 h-5 text-primary-400 mt-0.5" />
                <span className="text-gray-400">
                  Jl. Teknologi No. 123, Jakarta Selatan<br />
                  Indonesia 12560
                </span>
              </li>
              <li className="flex items-center space-x-3">
                <Phone className="w-5 h-5 text-primary-400" />
                <a href="tel:+622112345678" className="text-gray-400 hover:text-primary-400 transition-colors">
                  +62 21 1234 5678
                </a>
              </li>
              <li className="flex items-center space-x-3">
                <Mail className="w-5 h-5 text-primary-400" />
                <a href="mailto:info@ytcraft.id" className="text-gray-400 hover:text-primary-400 transition-colors">
                  info@ytcraft.id
                </a>
              </li>
            </ul>
          </div>
        </div>

        {/* Copyright */}
        <div className="border-t border-gray-800 py-6">
          <div className="flex flex-col md:flex-row justify-between items-center">
            <p className="text-gray-400 text-sm">
              © {currentYear} CV YTCraft Indonesia. All rights reserved.
            </p>
            <div className="flex space-x-6 mt-4 md:mt-0">
              <Link href="/privacy" className="text-sm text-gray-400 hover:text-primary-400 transition-colors">
                Privacy Policy
              </Link>
              <Link href="/terms" className="text-sm text-gray-400 hover:text-primary-400 transition-colors">
                Terms of Service
              </Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF

# ========== COMPONENTS UI ==========
cat > components/ui/Button.tsx << 'EOF'
import { ReactNode } from 'react';

interface ButtonProps {
  children: ReactNode;
  variant?: 'primary' | 'secondary' | 'outline';
  size?: 'sm' | 'md' | 'lg';
  className?: string;
  onClick?: () => void;
  type?: 'button' | 'submit' | 'reset';
}

export default function Button({
  children,
  variant = 'primary',
  size = 'md',
  className = '',
  onClick,
  type = 'button',
}: ButtonProps) {
  const baseStyles = 'font-medium rounded-lg transition-all duration-300 inline-flex items-center justify-center';
  
  const variants = {
    primary: 'bg-gradient-to-r from-primary-600 to-primary-700 text-white hover:from-primary-700 hover:to-primary-800 shadow-lg hover:shadow-xl',
    secondary: 'bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-gray-200 hover:bg-gray-200 dark:hover:bg-gray-700',
    outline: 'border border-gray-300 dark:border-gray-600 text-gray-700 dark:text-gray-300 hover:border-primary-500 hover:text-primary-600 dark:hover:text-primary-400',
  };

  const sizes = {
    sm: 'px-4 py-2 text-sm',
    md: 'px-6 py-3 text-base',
    lg: 'px-8 py-4 text-lg',
  };

  return (
    <button
      type={type}
      className={`${baseStyles} ${variants[variant]} ${sizes[size]} ${className} hover:scale-105 active:scale-95`}
      onClick={onClick}
    >
      {children}
    </button>
  );
}
EOF

cat > components/ui/Card.tsx << 'EOF'
import { ReactNode } from 'react';

interface CardProps {
  children: ReactNode;
  className?: string;
  hover?: boolean;
}

export default function Card({ children, className = '', hover = true }: CardProps) {
  return (
    <div className={`
      bg-white dark:bg-dark-surface rounded-xl shadow-lg 
      ${hover ? 'card-hover' : ''}
      ${className}
    `}>
      {children}
    </div>
  );
}
EOF

cat > components/ui/WhatsAppButton.tsx << 'EOF'
'use client';

import { MessageCircle } from 'lucide-react';
import { useState } from 'react';

export default function WhatsAppButton() {
  const [isHovered, setIsHovered] = useState(false);

  const phoneNumber = '+6281234567890';
  const message = 'Hello YTCraft, I would like to know more about your services';

  const whatsappUrl = `https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`;

  return (
    <div className="fixed bottom-6 right-6 z-50">
      <a
        href={whatsappUrl}
        target="_blank"
        rel="noopener noreferrer"
        className="block"
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
      >
        {/* Floating Button */}
        <div className="relative">
          <div className="w-14 h-14 bg-gradient-to-br from-green-500 to-green-600 rounded-full flex items-center justify-center shadow-xl hover:shadow-2xl transition-all duration-300 hover:scale-110">
            <MessageCircle className="w-7 h-7 text-white" />
          </div>
          
          {/* Notification Badge */}
          <div className="absolute -top-1 -right-1">
            <div className="w-5 h-5 bg-red-500 rounded-full flex items-center justify-center">
              <span className="text-white text-xs font-bold">1</span>
            </div>
          </div>

          {/* Tooltip */}
          {isHovered && (
            <div className="absolute right-16 bottom-1/2 transform translate-y-1/2 animate-slide-up">
              <div className="bg-gray-900 text-white px-4 py-2 rounded-lg whitespace-nowrap shadow-xl">
                <div className="text-sm font-medium">Chat with us!</div>
                <div className="text-xs text-gray-300">Typically replies within minutes</div>
              </div>
              <div className="absolute right-0 top-1/2 transform translate-x-1/2 -translate-y-1/2 rotate-45 w-3 h-3 bg-gray-900" />
            </div>
          )}
        </div>
      </a>
    </div>
  );
}
EOF

# ========== COMPONENTS SECTIONS ==========
cat > components/sections/HeroSection.tsx << 'EOF'
'use client';

import { useEffect, useState } from 'react';
import { ArrowRight, Sparkles, ChevronDown } from 'lucide-react';

export default function HeroSection() {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    setIsVisible(true);
  }, []);

  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden">
      {/* Background Effects */}
      <div className="absolute inset-0 bg-gradient-to-br from-dark-bg via-primary-900/20 to-dark-bg" />
      <div className="absolute top-0 left-1/4 w-96 h-96 bg-primary-500/10 rounded-full blur-3xl animate-pulse" />
      <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-primary-600/10 rounded-full blur-3xl animate-pulse delay-1000" />

      <div className="container-custom relative z-10">
        <div className={`max-w-4xl mx-auto text-center transition-all duration-700 ${
          isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'
        }`}>
          {/* Logo */}
          <div className="flex justify-center mb-8">
            <div className="relative">
              <div className="w-32 h-32 bg-gradient-to-br from-primary-500 via-primary-600 to-primary-700 rounded-2xl flex items-center justify-center shadow-2xl">
                <span className="text-white text-4xl font-bold">YTC</span>
              </div>
              <div className="absolute -top-2 -right-2">
                <Sparkles className="w-8 h-8 text-yellow-400 animate-spin-slow" />
              </div>
            </div>
          </div>

          {/* Slogan */}
          <h1 className="text-5xl md:text-7xl font-bold mb-6">
            <span className="gradient-text">Crafting the Future</span>
            <br />
            <span className="text-gray-800 dark:text-white">with Technology</span>
          </h1>

          {/* Description */}
          <p className="text-xl text-gray-600 dark:text-gray-300 mb-10 max-w-2xl mx-auto">
            CV YTCraft Indonesia adalah perusahaan inovasi teknologi yang menggabungkan kreativitas dengan solusi teknis untuk membangun masa depan yang lebih baik.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="/contact"
              className="group inline-flex items-center justify-center px-8 py-4 text-base font-medium text-white bg-gradient-to-r from-primary-600 to-primary-700 rounded-xl hover:from-primary-700 hover:to-primary-800 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
            >
              Start Collaboration
              <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
            </a>
            <a
              href="/portfolio"
              className="inline-flex items-center justify-center px-8 py-4 text-base font-medium text-gray-700 dark:text-gray-300 bg-white/80 dark:bg-gray-800/80 backdrop-blur-sm rounded-xl border border-gray-200 dark:border-gray-700 hover:bg-white dark:hover:bg-gray-800 transition-all duration-300 hover:scale-105"
            >
              View Our Work
            </a>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-6 mt-20">
            {[
              { value: '50+', label: 'Projects Completed' },
              { value: '15+', label: 'Expert Engineers' },
              { value: '5+', label: 'Years Experience' },
              { value: '100%', label: 'Client Satisfaction' },
            ].map((stat, index) => (
              <div
                key={index}
                className="text-center p-6 bg-white/10 dark:bg-white/5 backdrop-blur-sm rounded-xl border border-white/20 animate-slide-up"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <div className="text-3xl font-bold text-primary-400 mb-2">
                  {stat.value}
                </div>
                <div className="text-sm text-gray-600 dark:text-gray-400">
                  {stat.label}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Scroll Indicator */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
        <div className="w-6 h-10 border-2 border-gray-400 rounded-full flex justify-center">
          <div className="w-1 h-3 bg-gray-400 rounded-full mt-2 animate-pulse" />
        </div>
      </div>
    </section>
  );
}
EOF

cat > components/sections/ServicesSection.tsx << 'EOF'
'use client';

import { services } from '@/data/services';
import { CheckCircle } from 'lucide-react';
import { useState } from 'react';

export default function ServicesSection() {
  const [hoveredService, setHoveredService] = useState<string | null>(null);

  return (
    <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
      <div className="container-custom">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">
            Our <span className="gradient-text">Services</span>
          </h2>
          <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
            Solusi teknologi komprehensif untuk berbagai kebutuhan bisnis dan industri
          </p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          {services.map((service, index) => (
            <div
              key={service.id}
              className="bg-white dark:bg-dark-surface rounded-xl p-6 shadow-lg card-hover"
              onMouseEnter={() => setHoveredService(service.id)}
              onMouseLeave={() => setHoveredService(null)}
              style={{ 
                animationDelay: `${index * 100}ms`,
                transform: hoveredService === service.id ? 'translateY(-8px)' : 'none'
              }}
            >
              <div className="flex items-start mb-4">
                <div className="text-3xl mr-4">{service.icon}</div>
                <div>
                  <h3 className="text-xl font-bold mb-2">{service.title}</h3>
                  <p className="text-gray-600 dark:text-gray-300">{service.description}</p>
                </div>
              </div>
              
              <ul className="space-y-2">
                {service.features.map((feature, idx) => (
                  <li key={idx} className="flex items-center text-sm">
                    <CheckCircle className="w-4 h-4 text-primary-500 mr-2" />
                    <span className="text-gray-700 dark:text-gray-300">{feature}</span>
                  </li>
                ))}
              </ul>

              <a
                href="/services"
                className="inline-block mt-6 text-primary-600 dark:text-primary-400 font-medium hover:text-primary-700 dark:hover:text-primary-300"
              >
                Learn more →
              </a>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF

cat > components/sections/PortfolioSection.tsx << 'EOF'
'use client';

import { ArrowUpRight } from 'lucide-react';
import { useState } from 'react';

const portfolioItems = [
  {
    id: '1',
    title: 'Smart Factory Automation',
    category: 'Industrial IoT',
    description: 'Sistem otomasi pabrik dengan integrasi IoT',
    imageUrl: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600&h=400&fit=crop',
    client: 'Manufacturing Corp',
    year: '2023',
  },
  {
    id: '2',
    title: 'Health Monitoring System',
    category: 'Healthcare Tech',
    description: 'Platform monitoring kesehatan real-time',
    imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=600&h=400&fit=crop',
    client: 'Hospital Network',
    year: '2023',
  },
  {
    id: '3',
    title: 'E-commerce Platform',
    category: 'Digital Solution',
    description: 'Platform e-commerce dengan AI recommendation',
    imageUrl: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=600&h=400&fit=crop',
    client: 'Retail Chain',
    year: '2022',
  },
];

export default function PortfolioSection() {
  const [activeFilter, setActiveFilter] = useState('all');

  const filters = ['all', 'iot', 'healthcare', 'digital', 'hardware'];

  return (
    <section className="section-padding">
      <div className="container-custom">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">
            Our <span className="gradient-text">Portfolio</span>
          </h2>
          <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto mb-8">
            Hasil karya dan project yang telah kami selesaikan dengan sukses
          </p>

          {/* Filter Buttons */}
          <div className="flex flex-wrap justify-center gap-2 mb-10">
            {filters.map((filter) => (
              <button
                key={filter}
                onClick={() => setActiveFilter(filter)}
                className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                  activeFilter === filter
                    ? 'bg-primary-600 text-white'
                    : 'bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700'
                }`}
              >
                {filter.charAt(0).toUpperCase() + filter.slice(1)}
              </button>
            ))}
          </div>
        </div>

        {/* Portfolio Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          {portfolioItems.map((item, index) => (
            <div
              key={item.id}
              className="group relative overflow-hidden rounded-xl bg-white dark:bg-dark-surface shadow-lg card-hover"
            >
              {/* Image */}
              <div className="h-48 overflow-hidden">
                <img
                  src={item.imageUrl}
                  alt={item.title}
                  className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
              </div>

              {/* Content */}
              <div className="p-6">
                <div className="flex justify-between items-start mb-2">
                  <div>
                    <span className="text-xs font-medium text-primary-600 dark:text-primary-400 bg-primary-50 dark:bg-primary-900/30 px-3 py-1 rounded-full">
                      {item.category}
                    </span>
                    <h3 className="text-lg font-bold mt-2">{item.title}</h3>
                  </div>
                  <ArrowUpRight className="w-5 h-5 text-gray-400 group-hover:text-primary-600 transition-colors" />
                </div>
                
                <p className="text-gray-600 dark:text-gray-300 mb-4">{item.description}</p>
                
                <div className="flex justify-between items-center text-sm text-gray-500 dark:text-gray-400">
                  <span>{item.client}</span>
                  <span>{item.year}</span>
                </div>
              </div>

              {/* Hover Overlay */}
              <div className="absolute inset-0 bg-gradient-to-t from-primary-600/90 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-end p-6">
                <button className="w-full py-3 bg-white text-primary-600 rounded-lg font-medium hover:bg-gray-100 transition-colors">
                  View Case Study
                </button>
              </div>
            </div>
          ))}
        </div>

        <div className="text-center mt-12">
          <a
            href="/portfolio"
            className="inline-flex items-center justify-center px-8 py-3 text-base font-medium text-primary-600 dark:text-primary-400 hover:text-primary-700 dark:hover:text-primary-300"
          >
            View All Projects
            <ArrowUpRight className="ml-2 w-5 h-5" />
          </a>
        </div>
      </div>
    </section>
  );
}
EOF

cat > components/sections/CTASection.tsx << 'EOF'
'use client';

import { ArrowRight, MessageSquare, Calendar, Users } from 'lucide-react';

export default function CTASection() {
  return (
    <section className="section-padding bg-gradient-to-br from-primary-600 to-primary-800">
      <div className="container-custom">
        <div className="max-w-4xl mx-auto text-center text-white">
          <h2 className="text-3xl md:text-5xl font-bold mb-6">
            Ready to Transform Your Business?
          </h2>
          <p className="text-xl mb-10 opacity-90">
            Mari berdiskusi tentang solusi teknologi yang tepat untuk kebutuhan Anda
          </p>

          <div className="grid md:grid-cols-3 gap-6 mb-12">
            {[
              {
                icon: <MessageSquare className="w-8 h-8" />,
                title: 'Free Consultation',
                desc: 'Diskusi tanpa biaya dengan tim ahli kami',
              },
              {
                icon: <Calendar className="w-8 h-8" />,
                title: 'Flexible Schedule',
                desc: 'Atur jadwal sesuai kenyamanan Anda',
              },
              {
                icon: <Users className="w-8 h-8" />,
                title: 'Dedicated Team',
                desc: 'Tim khusus akan mendampingi proyek Anda',
              },
            ].map((item, index) => (
              <div
                key={index}
                className="bg-white/10 backdrop-blur-sm rounded-xl p-6 border border-white/20 animate-slide-up"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <div className="flex justify-center mb-4">
                  <div className="w-16 h-16 rounded-full bg-white/20 flex items-center justify-center">
                    {item.icon}
                  </div>
                </div>
                <h3 className="text-xl font-bold mb-2">{item.title}</h3>
                <p className="opacity-80">{item.desc}</p>
              </div>
            ))}
          </div>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="/contact"
              className="group inline-flex items-center justify-center px-8 py-4 text-base font-medium text-primary-700 bg-white rounded-xl hover:bg-gray-100 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
            >
              Get Started Now
              <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
            </a>
            <a
              href="https://wa.me/6281234567890"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center px-8 py-4 text-base font-medium text-white bg-green-600 rounded-xl hover:bg-green-700 transition-all duration-300 hover:scale-105 border-2 border-white/30"
            >
              Chat on WhatsApp
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}
EOF

# ========== APP LAYOUT ==========
cat > app/layout.tsx << 'EOF'
import type { Metadata } from 'next';
import { Inter, Plus_Jakarta_Sans } from 'next/font/google';
import '@/styles/globals.css';
import Navbar from '@/components/layout/Navbar';
import Footer from '@/components/layout/Footer';
import WhatsAppButton from '@/components/ui/WhatsAppButton';

const inter = Inter({
  subsets: ['latin'],
  variable: '--font-inter',
});

const plusJakartaSans = Plus_Jakarta_Sans({
  subsets: ['latin'],
  variable: '--font-plus-jakarta-sans',
});

export const metadata: Metadata = {
  title: 'CV YTCraft Indonesia - Crafting the Future with Technology',
  description: 'Perusahaan teknologi inovatif yang menggabungkan kreativitas dengan solusi teknis untuk membangun masa depan yang lebih baik.',
  keywords: ['technology', 'innovation', 'software development', 'electronics', 'digital solutions', 'YTCraft'],
  authors: [{ name: 'CV YTCraft Indonesia' }],
  openGraph: {
    type: 'website',
    url: 'https://ytcraft.id',
    title: 'CV YTCraft Indonesia',
    description: 'Crafting the Future with Technology',
    images: ['/og-image.png'],
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${inter.variable} ${plusJakartaSans.variable}`}>
      <head>
        <link rel="icon" href="/favicon.ico" />
      </head>
      <body>
        <Navbar />
        <div className="pt-16">
          {children}
        </div>
        <Footer />
        <WhatsAppButton />
      </body>
    </html>
  );
}
EOF

# ========== APP PAGES ==========
cat > app/page.tsx << 'EOF'
import HeroSection from '@/components/sections/HeroSection';
import ServicesSection from '@/components/sections/ServicesSection';
import PortfolioSection from '@/components/sections/PortfolioSection';
import CTASection from '@/components/sections/CTASection';

export default function Home() {
  return (
    <main className="min-h-screen">
      <HeroSection />
      <ServicesSection />
      <PortfolioSection />
      <CTASection />
    </main>
  );
}
EOF

cat > app/about/page.tsx << 'EOF'
import { Target, Eye, Users, Award, Heart, Globe, Lightbulb, Shield } from 'lucide-react';

export default function AboutPage() {
  const coreValues = [
    {
      icon: <Lightbulb className="w-8 h-8" />,
      title: 'Innovation',
      description: 'Terus berinovasi dalam teknologi dan solusi',
    },
    {
      icon: <Heart className="w-8 h-8" />,
      title: 'Excellence',
      description: 'Komitmen terhadap kualitas terbaik',
    },
    {
      icon: <Users className="w-8 h-8" />,
      title: 'Collaboration',
      description: 'Bekerja sama untuk hasil optimal',
    },
    {
      icon: <Shield className="w-8 h-8" />,
      title: 'Integrity',
      description: 'Transparansi dan kejujuran dalam setiap langkah',
    },
  ];

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              About <span className="gradient-text">YTCraft</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Perusahaan teknologi yang mengkombinasikan kreativitas dengan keahlian teknis untuk menciptakan solusi inovatif.
            </p>
          </div>
        </div>
      </section>

      {/* Vision & Mission */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="grid md:grid-cols-2 gap-12">
            {/* Vision */}
            <div className="bg-white dark:bg-dark-surface rounded-2xl p-8 shadow-lg card-hover">
              <div className="flex items-center mb-6">
                <div className="w-12 h-12 bg-primary-100 dark:bg-primary-900/30 rounded-lg flex items-center justify-center mr-4">
                  <Eye className="w-6 h-6 text-primary-600 dark:text-primary-400" />
                </div>
                <h2 className="text-2xl font-bold">Our Vision</h2>
              </div>
              <p className="text-gray-600 dark:text-gray-300">
                Menjadi perusahaan teknologi terdepan di Indonesia yang menginspirasi inovasi dan menciptakan solusi berkelanjutan untuk masa depan yang lebih baik.
              </p>
            </div>

            {/* Mission */}
            <div className="bg-white dark:bg-dark-surface rounded-2xl p-8 shadow-lg card-hover">
              <div className="flex items-center mb-6">
                <div className="w-12 h-12 bg-primary-100 dark:bg-primary-900/30 rounded-lg flex items-center justify-center mr-4">
                  <Target className="w-6 h-6 text-primary-600 dark:text-primary-400" />
                </div>
                <h2 className="text-2xl font-bold">Our Mission</h2>
              </div>
              <ul className="space-y-3 text-gray-600 dark:text-gray-300">
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Mengembangkan teknologi yang memecahkan masalah nyata
                </li>
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Memberikan solusi berkualitas tinggi dengan nilai terbaik
                </li>
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Membangun ekosistem teknologi yang berkelanjutan
                </li>
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Memberdayakan masyarakat melalui pendidikan teknologi
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      {/* Core Values */}
      <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
        <div className="container-custom">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold mb-4">Core Values</h2>
            <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
              Nilai-nilai yang membimbing setiap keputusan dan tindakan kami
            </p>
          </div>

          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {coreValues.map((value, index) => (
              <div
                key={index}
                className="bg-white dark:bg-dark-surface rounded-xl p-6 text-center shadow-lg card-hover animate-slide-up"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <div className="w-16 h-16 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
                  <div className="text-primary-600 dark:text-primary-400">
                    {value.icon}
                  </div>
                </div>
                <h3 className="text-xl font-bold mb-2">{value.title}</h3>
                <p className="text-gray-600 dark:text-gray-300">
                  {value.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Brand Philosophy */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="max-w-4xl mx-auto">
            <div className="text-center mb-12">
              <h2 className="text-3xl md:text-4xl font-bold mb-4">
                Brand Philosophy
              </h2>
              <div className="w-24 h-1 bg-gradient-to-r from-primary-500 to-primary-700 mx-auto rounded-full" />
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white dark:from-primary-900/20 dark:to-dark-surface rounded-2xl p-8 md:p-12 shadow-xl">
              <blockquote className="text-2xl md:text-3xl font-medium text-gray-800 dark:text-white mb-6 text-center">
                "Technology is not just about what it can do, but about what it can enable people to do."
              </blockquote>
              <p className="text-gray-600 dark:text-gray-300 text-center">
                Di YTCraft, kami percaya bahwa teknologi terbaik adalah yang memberdayakan, menginspirasi, dan menciptakan nilai nyata bagi pengguna. Setiap proyek adalah kesempatan untuk menciptakan sesuatu yang berarti.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Team Stats */}
      <section className="section-padding bg-gradient-to-r from-primary-600 to-primary-800 text-white">
        <div className="container-custom">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            {[
              { value: '15+', label: 'Expert Engineers' },
              { value: '8', label: 'Departments' },
              { value: '5000+', label: 'Hours of Expertise' },
              { value: '100%', label: 'Dedication' },
            ].map((stat, index) => (
              <div key={index} className="animate-slide-up" style={{ animationDelay: `${index * 100}ms` }}>
                <div className="text-4xl font-bold mb-2">{stat.value}</div>
                <div className="opacity-90">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </main>
  );
}
EOF

cat > app/services/page.tsx << 'EOF'
import { services } from '@/data/services';
import { CheckCircle, ArrowRight } from 'lucide-react';

export default function ServicesPage() {
  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              Our <span className="gradient-text">Services</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Solusi teknologi komprehensif yang dirancang untuk mendukung pertumbuhan bisnis Anda
            </p>
          </div>
        </div>
      </section>

      {/* Services List */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="space-y-12">
            {services.map((service, index) => (
              <div
                key={service.id}
                className={`flex flex-col lg:flex-row gap-8 items-center ${
                  index % 2 === 1 ? 'lg:flex-row-reverse' : ''
                }`}
              >
                {/* Icon/Image */}
                <div className="lg:w-1/3">
                  <div className="w-48 h-48 mx-auto bg-gradient-to-br from-primary-500/20 to-primary-600/20 rounded-3xl flex items-center justify-center">
                    <div className="text-6xl">{service.icon}</div>
                  </div>
                </div>

                {/* Content */}
                <div className="lg:w-2/3">
                  <div className="inline-flex items-center px-4 py-2 rounded-full bg-primary-100 dark:bg-primary-900/30 text-primary-700 dark:text-primary-400 text-sm font-medium mb-4">
                    Service {index + 1}
                  </div>
                  <h2 className="text-3xl font-bold mb-4">{service.title}</h2>
                  <p className="text-gray-600 dark:text-gray-300 mb-6">
                    {service.description}
                  </p>

                  <div className="grid sm:grid-cols-2 gap-4 mb-8">
                    {service.features.map((feature, idx) => (
                      <div key={idx} className="flex items-center">
                        <CheckCircle className="w-5 h-5 text-primary-500 mr-3 flex-shrink-0" />
                        <span className="text-gray-700 dark:text-gray-300">{feature}</span>
                      </div>
                    ))}
                  </div>

                  <a
                    href="/contact"
                    className="inline-flex items-center text-primary-600 dark:text-primary-400 font-medium hover:text-primary-700 dark:hover:text-primary-300 group"
                  >
                    Request this service
                    <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
                  </a>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Process */}
      <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
        <div className="container-custom">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold mb-4">Our Process</h2>
            <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
              Metodologi terstruktur yang memastikan keberhasilan proyek
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-8">
            {[
              { step: '01', title: 'Discovery', desc: 'Analisis kebutuhan dan tujuan' },
              { step: '02', title: 'Planning', desc: 'Rencana dan strategi implementasi' },
              { step: '03', title: 'Development', desc: 'Eksekusi dan pengembangan' },
              { step: '04', title: 'Delivery', desc: 'Implementasi dan dukungan' },
            ].map((process, index) => (
              <div key={index} className="text-center">
                <div className="w-16 h-16 bg-gradient-to-br from-primary-500 to-primary-700 rounded-full flex items-center justify-center text-white text-xl font-bold mb-4 mx-auto">
                  {process.step}
                </div>
                <h3 className="text-xl font-bold mb-2">{process.title}</h3>
                <p className="text-gray-600 dark:text-gray-300">{process.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="bg-gradient-to-r from-primary-600 to-primary-800 rounded-3xl p-8 md:p-12 text-white text-center">
            <h2 className="text-3xl md:text-4xl font-bold mb-6">
              Ready to Start Your Project?
            </h2>
            <p className="text-xl mb-8 max-w-2xl mx-auto opacity-90">
              Konsultasikan kebutuhan teknologi Anda dengan tim ahli kami
            </p>
            <a
              href="/contact"
              className="inline-flex items-center justify-center px-8 py-4 text-base font-medium text-primary-700 bg-white rounded-xl hover:bg-gray-100 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
            >
              Schedule a Consultation
              <ArrowRight className="ml-2 w-5 h-5" />
            </a>
          </div>
        </div>
      </section>
    </main>
  );
}
EOF

cat > app/products/page.tsx << 'EOF'
'use client';

import { products } from '@/data/products';
import { ShoppingCart, Download, Play, Tag, Calendar, Award } from 'lucide-react';
import { useState } from 'react';

export default function ProductsPage() {
  const [activeCategory, setActiveCategory] = useState('all');

  const categories = [
    { id: 'all', name: 'All Products' },
    { id: 'digital', name: 'Digital Products' },
    { id: 'physical', name: 'Physical Products' },
    { id: 'game', name: 'Games' },
  ];

  const filteredProducts = activeCategory === 'all' 
    ? products 
    : products.filter(product => product.category === activeCategory);

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              Our <span className="gradient-text">Products</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Produk inovatif yang menggabungkan teknologi mutakhir dengan desain premium
            </p>
          </div>
        </div>
      </section>

      {/* Filter */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="flex flex-wrap justify-center gap-2 mb-12">
            {categories.map((category) => (
              <button
                key={category.id}
                onClick={() => setActiveCategory(category.id)}
                className={`px-6 py-3 rounded-full text-sm font-medium transition-all ${
                  activeCategory === category.id
                    ? 'bg-primary-600 text-white'
                    : 'bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700'
                }`}
              >
                {category.name}
              </button>
            ))}
          </div>

          {/* Products Grid */}
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {filteredProducts.map((product, index) => (
              <div
                key={product.id}
                className="bg-white dark:bg-dark-surface rounded-2xl shadow-xl overflow-hidden card-hover group"
              >
                {/* Product Image */}
                <div className="relative h-48 overflow-hidden">
                  <img
                    src={product.imageUrl}
                    alt={product.name}
                    className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                  />
                  <div className="absolute top-4 left-4">
                    <span className={`px-3 py-1 rounded-full text-xs font-medium ${
                      product.category === 'digital' 
                        ? 'bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-400'
                        : product.category === 'physical'
                        ? 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400'
                        : 'bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-400'
                    }`}>
                      {product.category.charAt(0).toUpperCase() + product.category.slice(1)}
                    </span>
                  </div>
                </div>

                {/* Product Content */}
                <div className="p-6">
                  <h3 className="text-xl font-bold mb-2">{product.name}</h3>
                  <p className="text-gray-600 dark:text-gray-300 mb-4">
                    {product.description}
                  </p>

                  {/* Features */}
                  <ul className="space-y-2 mb-6">
                    {product.features.slice(0, 3).map((feature, idx) => (
                      <li key={idx} className="flex items-center text-sm text-gray-600 dark:text-gray-400">
                        <div className="w-1.5 h-1.5 bg-primary-500 rounded-full mr-2" />
                        {feature}
                      </li>
                    ))}
                  </ul>

                  {/* Price & Actions */}
                  <div className="flex items-center justify-between">
                    <div>
                      {product.price && (
                        <div className="text-2xl font-bold text-primary-600 dark:text-primary-400">
                          {product.price}
                        </div>
                      )}
                    </div>
                    <div className="flex gap-2">
                      <button className="p-2 rounded-lg bg-primary-100 dark:bg-primary-900/30 text-primary-600 dark:text-primary-400 hover:bg-primary-200 dark:hover:bg-primary-800/50 transition-colors">
                        <ShoppingCart className="w-5 h-5" />
                      </button>
                      <button className="p-2 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors">
                        {product.category === 'game' ? (
                          <Play className="w-5 h-5" />
                        ) : (
                          <Download className="w-5 h-5" />
                        )}
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Empty State */}
          {filteredProducts.length === 0 && (
            <div className="text-center py-12">
              <Tag className="w-16 h-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-bold mb-2">No products found</h3>
              <p className="text-gray-600 dark:text-gray-400">
                No products available in this category yet.
              </p>
            </div>
          )}
        </div>
      </section>

      {/* Stats */}
      <section className="section-padding bg-gradient-to-r from-primary-600 to-primary-800 text-white">
        <div className="container-custom">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            {[
              { icon: <Award className="w-8 h-8 mx-auto mb-4" />, value: '50+', label: 'Products Developed' },
              { icon: <Calendar className="w-8 h-8 mx-auto mb-4" />, value: '2020', label: 'Year Established' },
              { icon: <Tag className="w-8 h-8 mx-auto mb-4" />, value: '12', label: 'Product Categories' },
              { icon: <ShoppingCart className="w-8 h-8 mx-auto mb-4" />, value: '1000+', label: 'Happy Customers' },
            ].map((stat, index) => (
              <div key={index} className="animate-slide-up" style={{ animationDelay: `${index * 100}ms` }}>
                {stat.icon}
                <div className="text-3xl font-bold mb-2">{stat.value}</div>
                <div className="opacity-90">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="bg-gradient-to-r from-gray-900 to-gray-800 rounded-3xl p-8 md:p-12 text-white text-center">
            <h2 className="text-3xl md:text-4xl font-bold mb-6">
              Custom Product Development
            </h2>
            <p className="text-xl mb-8 max-w-2xl mx-auto opacity-90">
              Butuh produk khusus yang sesuai dengan kebutuhan bisnis Anda? Kami siap membantu.
            </p>
            <a
              href="/contact"
              className="inline-flex items-center justify-center px-8 py-4 text-base font-medium text-gray-900 bg-white rounded-xl hover:bg-gray-100 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
            >
              Request Custom Product
              <ShoppingCart className="ml-2 w-5 h-5" />
            </a>
          </div>
        </div>
      </section>
    </main>
  );
}
EOF

cat > app/portfolio/page.tsx << 'EOF'
'use client';

import { ArrowUpRight, ExternalLink, Users, Calendar, Award, Filter } from 'lucide-react';
import { useState } from 'react';

const portfolioItems = [
  {
    id: '1',
    title: 'Smart Factory Automation',
    category: 'Industrial IoT',
    description: 'Sistem otomasi pabrik lengkap dengan monitoring real-time dan predictive maintenance',
    imageUrl: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=800&h=600&fit=crop',
    client: 'Manufacturing Corp',
    year: '2023',
    duration: '6 months',
    technologies: ['IoT', 'AI', 'Cloud'],
    results: ['Efficiency +40%', 'Downtime -60%', 'ROI 300%'],
  },
  {
    id: '2',
    title: 'Health Monitoring Platform',
    category: 'Healthcare Tech',
    description: 'Platform monitoring kesehatan untuk rumah sakit dengan integrasi wearable devices',
    imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=800&h=600&fit=crop',
    client: 'National Hospital',
    year: '2023',
    duration: '8 months',
    technologies: ['React', 'Node.js', 'PostgreSQL'],
    results: ['Accuracy 99%', 'Response Time -70%', 'User Satisfaction 95%'],
  },
  {
    id: '3',
    title: 'E-commerce Enterprise Solution',
    category: 'Digital Solution',
    description: 'Platform e-commerce B2B dengan sistem inventory dan payment terintegrasi',
    imageUrl: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&h=600&fit=crop',
    client: 'Retail Chain',
    year: '2022',
    duration: '10 months',
    technologies: ['Next.js', 'Python', 'AWS'],
    results: ['Sales +150%', 'Load Time -80%', 'Conversion +35%'],
  },
  {
    id: '4',
    title: 'Smart Agriculture System',
    category: 'IoT Solution',
    description: 'Sistem pertanian pintar dengan sensor IoT dan kontrol otomatis',
    imageUrl: 'https://images.unsplash.com/photo-1591280443696-8a5f6b3974a5?w=800&h=600&fit=crop',
    client: 'AgriTech Startup',
    year: '2022',
    duration: '5 months',
    technologies: ['IoT', 'Mobile App', 'Cloud'],
    results: ['Yield +50%', 'Water Usage -40%', 'Cost -30%'],
  },
  {
    id: '5',
    title: 'Educational Gaming Platform',
    category: 'Game Development',
    description: 'Platform game edukasi untuk anak-anak dengan konten kurikulum',
    imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=800&h=600&fit=crop',
    client: 'Education Ministry',
    year: '2021',
    duration: '12 months',
    technologies: ['Unity', 'React Native', 'Firebase'],
    results: ['Engagement +200%', 'Learning Speed +45%', 'User Base 500K+'],
  },
  {
    id: '6',
    title: 'Banking Security System',
    category: 'Security Tech',
    description: 'Sistem keamanan perbankan dengan biometric authentication',
    imageUrl: 'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=800&h=600&fit=crop',
    client: 'National Bank',
    year: '2021',
    duration: '9 months',
    technologies: ['Blockchain', 'AI', 'Biometrics'],
    results: ['Security +99.9%', 'Fraud -95%', 'Compliance 100%'],
  },
];

const categories = ['all', 'iot', 'healthcare', 'digital', 'game', 'security'];

export default function PortfolioPage() {
  const [activeFilter, setActiveFilter] = useState('all');

  const filteredItems = activeFilter === 'all'
    ? portfolioItems
    : portfolioItems.filter(item => 
        item.category.toLowerCase().includes(activeFilter.toLowerCase())
      );

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              Our <span className="gradient-text">Portfolio</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Koleksi project sukses yang telah kami selesaikan untuk klien dari berbagai industri
            </p>
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-6 mb-12">
            {[
              { value: '50+', label: 'Projects Completed' },
              { value: '30+', label: 'Happy Clients' },
              { value: '15', label: 'Industries Served' },
              { value: '100%', label: 'Success Rate' },
            ].map((stat, index) => (
              <div
                key={index}
                className="bg-white dark:bg-dark-surface rounded-xl p-6 text-center shadow-lg"
              >
                <div className="text-3xl font-bold text-primary-600 dark:text-primary-400 mb-2">
                  {stat.value}
                </div>
                <div className="text-gray-600 dark:text-gray-300">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Filters */}
      <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
        <div className="container-custom">
          <div className="flex flex-wrap justify-center gap-2 mb-8">
            <div className="flex items-center gap-2 text-gray-600 dark:text-gray-400 mb-4 w-full justify-center">
              <Filter className="w-5 h-5" />
              <span className="font-medium">Filter by Category:</span>
            </div>
            {categories.map((category) => (
              <button
                key={category}
                onClick={() => setActiveFilter(category)}
                className={`px-6 py-3 rounded-full text-sm font-medium transition-all ${
                  activeFilter === category
                    ? 'bg-primary-600 text-white'
                    : 'bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700'
                }`}
              >
                {category.charAt(0).toUpperCase() + category.slice(1)}
              </button>
            ))}
          </div>

          {/* Portfolio Grid */}
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {filteredItems.map((item) => (
              <div
                key={item.id}
                className="group bg-white dark:bg-dark-surface rounded-2xl shadow-xl overflow-hidden card-hover"
              >
                {/* Image */}
                <div className="relative h-48 overflow-hidden">
                  <img
                    src={item.imageUrl}
                    alt={item.title}
                    className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                  <div className="absolute top-4 left-4">
                    <span className="px-3 py-1 rounded-full text-xs font-medium bg-white/20 backdrop-blur-sm text-white">
                      {item.category}
                    </span>
                  </div>
                </div>

                {/* Content */}
                <div className="p-6">
                  <div className="flex justify-between items-start mb-4">
                    <h3 className="text-xl font-bold">{item.title}</h3>
                    <ExternalLink className="w-5 h-5 text-gray-400 group-hover:text-primary-600 transition-colors" />
                  </div>
                  
                  <p className="text-gray-600 dark:text-gray-300 mb-6">{item.description}</p>

                  {/* Details */}
                  <div className="grid grid-cols-2 gap-4 mb-6">
                    <div className="flex items-center text-sm text-gray-500 dark:text-gray-400">
                      <Users className="w-4 h-4 mr-2" />
                      {item.client}
                    </div>
                    <div className="flex items-center text-sm text-gray-500 dark:text-gray-400">
                      <Calendar className="w-4 h-4 mr-2" />
                      {item.year} • {item.duration}
                    </div>
                  </div>

                  {/* Technologies */}
                  <div className="flex flex-wrap gap-2 mb-6">
                    {item.technologies.map((tech, idx) => (
                      <span
                        key={idx}
                        className="px-3 py-1 bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 rounded-full text-xs"
                      >
                        {tech}
                      </span>
                    ))}
                  </div>

                  {/* Results */}
                  <div className="border-t border-gray-200 dark:border-gray-700 pt-6">
                    <div className="flex items-center gap-2 text-sm font-medium text-gray-700 dark:text-gray-300 mb-3">
                      <Award className="w-4 h-4" />
                      Key Results:
                    </div>
                    <div className="flex flex-wrap gap-2">
                      {item.results.map((result, idx) => (
                        <span
                          key={idx}
                          className="px-3 py-1 bg-primary-50 dark:bg-primary-900/30 text-primary-700 dark:text-primary-400 rounded-full text-xs"
                        >
                          {result}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Empty State */}
          {filteredItems.length === 0 && (
            <div className="text-center py-12">
              <Filter className="w-16 h-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-bold mb-2">No projects found</h3>
              <p className="text-gray-600 dark:text-gray-400">
                No projects available in this category yet.
              </p>
            </div>
          )}
        </div>
      </section>

      {/* CTA */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="bg-gradient-to-r from-primary-600 to-primary-800 rounded-3xl p-8 md:p-12 text-white text-center">
            <h2 className="text-3xl md:text-4xl font-bold mb-6">
              Ready to Start Your Project?
            </h2>
            <p className="text-xl mb-8 max-w-2xl mx-auto opacity-90">
              Jadikan ide Anda menjadi kenyataan dengan teknologi yang tepat
            </p>
            <a
              href="/contact"
              className="inline-flex items-center justify-center px-8 py-4 text-base font-medium text-primary-700 bg-white rounded-xl hover:bg-gray-100 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
            >
              Start Your Project
              <ArrowUpRight className="ml-2 w-5 h-5" />
            </a>
          </div>
        </div>
      </section>
    </main>
  );
}
EOF

cat > app/articles/page.tsx << 'EOF'
'use client';

import { articles } from '@/data/articles';
import { Calendar, User, Clock, Tag, Search, Filter } from 'lucide-react';
import { useState } from 'react';

export default function ArticlesPage() {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('all');

  const categories = ['all', 'Technology', 'AI', 'Healthcare', 'Sustainability'];

  const filteredArticles = articles.filter(article => {
    const matchesSearch = article.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         article.excerpt.toLowerCase().includes(searchQuery.toLowerCase());
    const matchesCategory = selectedCategory === 'all' || article.category === selectedCategory;
    return matchesSearch && matchesCategory;
  });

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              Latest <span className="gradient-text">Articles</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Insight dan update terbaru seputar teknologi, inovasi, dan industri
            </p>
          </div>
        </div>
      </section>

      {/* Search & Filter */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="max-w-4xl mx-auto">
            {/* Search Bar */}
            <div className="relative mb-8">
              <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 w-5 h-5 text-gray-400" />
              <input
                type="text"
                placeholder="Search articles..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full pl-12 pr-4 py-4 bg-white dark:bg-dark-surface border border-gray-300 dark:border-gray-700 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500"
              />
            </div>

            {/* Categories */}
            <div className="flex flex-wrap gap-2 mb-12 justify-center">
              <div className="flex items-center gap-2 text-gray-600 dark:text-gray-400 mb-2 w-full justify-center">
                <Filter className="w-5 h-5" />
                <span className="font-medium">Filter by Category:</span>
              </div>
              {categories.map((category) => (
                <button
                  key={category}
                  onClick={() => setSelectedCategory(category)}
                  className={`px-6 py-3 rounded-full text-sm font-medium transition-all ${
                    selectedCategory === category
                      ? 'bg-primary-600 text-white'
                      : 'bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700'
                  }`}
                >
                  {category}
                </button>
              ))}
            </div>

            {/* Articles Grid */}
            <div className="space-y-8">
              {filteredArticles.map((article, index) => (
                <article
                  key={article.id}
                  className="bg-white dark:bg-dark-surface rounded-2xl shadow-lg overflow-hidden card-hover group animate-slide-up"
                  style={{ animationDelay: `${index * 100}ms` }}
                >
                  <div className="md:flex">
                    {/* Image */}
                    <div className="md:w-1/3">
                      <div className="h-48 md:h-full relative overflow-hidden">
                        <img
                          src={article.imageUrl}
                          alt={article.title}
                          className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                        />
                        <div className="absolute top-4 left-4">
                          <span className="px-3 py-1 rounded-full text-xs font-medium bg-white/20 backdrop-blur-sm text-white">
                            {article.category}
                          </span>
                        </div>
                      </div>
                    </div>

                    {/* Content */}
                    <div className="md:w-2/3 p-6">
                      <div className="flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400 mb-4">
                        <span className="flex items-center">
                          <User className="w-4 h-4 mr-1" />
                          {article.author}
                        </span>
                        <span className="flex items-center">
                          <Calendar className="w-4 h-4 mr-1" />
                          {new Date(article.date).toLocaleDateString('id-ID', {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric'
                          })}
                        </span>
                        <span className="flex items-center">
                          <Clock className="w-4 h-4 mr-1" />
                          {article.readTime}
                        </span>
                      </div>

                      <h2 className="text-2xl font-bold mb-3 group-hover:text-primary-600 dark:group-hover:text-primary-400 transition-colors">
                        <a href={`/articles/${article.slug}`}>{article.title}</a>
                      </h2>
                      
                      <p className="text-gray-600 dark:text-gray-300 mb-6">
                        {article.excerpt}
                      </p>

                      {/* Tags */}
                      <div className="flex flex-wrap gap-2 mb-6">
                        {article.tags.map((tag) => (
                          <span
                            key={tag}
                            className="inline-flex items-center px-3 py-1 rounded-full text-xs bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300"
                          >
                            <Tag className="w-3 h-3 mr-1" />
                            {tag}
                          </span>
                        ))}
                      </div>

                      <a
                        href={`/articles/${article.slug}`}
                        className="inline-flex items-center text-primary-600 dark:text-primary-400 font-medium hover:text-primary-700 dark:hover:text-primary-300 group"
                      >
                        Read full article
                        <span className="ml-2 group-hover:translate-x-1 transition-transform">→</span>
                      </a>
                    </div>
                  </div>
                </article>
              ))}

              {/* Empty State */}
              {filteredArticles.length === 0 && (
                <div className="text-center py-12">
                  <Search className="w-16 h-16 text-gray-400 mx-auto mb-4" />
                  <h3 className="text-xl font-bold mb-2">No articles found</h3>
                  <p className="text-gray-600 dark:text-gray-400">
                    Try adjusting your search or filter criteria.
                  </p>
                </div>
              )}
            </div>

            {/* Newsletter */}
            <div className="mt-16 bg-gradient-to-r from-primary-50 to-primary-100 dark:from-primary-900/20 dark:to-primary-800/20 rounded-2xl p-8 text-center">
              <h3 className="text-2xl font-bold mb-4">Stay Updated</h3>
              <p className="text-gray-600 dark:text-gray-300 mb-6">
                Subscribe to our newsletter for the latest articles and insights
              </p>
              <div className="max-w-md mx-auto flex gap-2">
                <input
                  type="email"
                  placeholder="Enter your email"
                  className="flex-1 px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-dark-surface focus:outline-none focus:ring-2 focus:ring-primary-500"
                />
                <button className="px-6 py-3 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors">
                  Subscribe
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  );
}
EOF

cat > app/articles/[slug]/page.tsx << 'EOF'
'use client';

import { articles } from '@/data/articles';
import { Calendar, User, Clock, Tag, ArrowLeft, Share2, Bookmark, Eye } from 'lucide-react';
import { notFound } from 'next/navigation';
import { useParams } from 'next/navigation';

export default function ArticleDetailPage() {
  const params = useParams();
  const article = articles.find(a => a.slug === params.slug);

  if (!article) {
    notFound();
  }

  const relatedArticles = articles
    .filter(a => a.id !== article.id && a.category === article.category)
    .slice(0, 2);

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom max-w-4xl">
          {/* Back Button */}
          <a
            href="/articles"
            className="inline-flex items-center text-primary-600 dark:text-primary-400 hover:text-primary-700 dark:hover:text-primary-300 mb-8 group"
          >
            <ArrowLeft className="w-5 h-5 mr-2 group-hover:-translate-x-1 transition-transform" />
            Back to Articles
          </a>

          {/* Article Header */}
          <div className="mb-8">
            <div className="flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400 mb-4">
              <span className="px-3 py-1 rounded-full bg-primary-100 dark:bg-primary-900/30 text-primary-700 dark:text-primary-400 font-medium">
                {article.category}
              </span>
              <span className="flex items-center">
                <Calendar className="w-4 h-4 mr-1" />
                {new Date(article.date).toLocaleDateString('id-ID', {
                  year: 'numeric',
                  month: 'long',
                  day: 'numeric'
                })}
              </span>
              <span className="flex items-center">
                <Clock className="w-4 h-4 mr-1" />
                {article.readTime}
              </span>
              <span className="flex items-center">
                <Eye className="w-4 h-4 mr-1" />
                1.2k views
              </span>
            </div>

            <h1 className="text-4xl md:text-5xl font-bold mb-6">{article.title}</h1>
            
            <div className="flex items-center justify-between">
              <div className="flex items-center">
                <div className="w-10 h-10 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center text-primary-600 dark:text-primary-400 font-bold mr-3">
                  {article.author.charAt(0)}
                </div>
                <div>
                  <div className="font-medium">{article.author}</div>
                  <div className="text-sm text-gray-500 dark:text-gray-400">Senior Writer</div>
                </div>
              </div>

              <div className="flex gap-2">
                <button className="p-2 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors">
                  <Share2 className="w-5 h-5" />
                </button>
                <button className="p-2 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors">
                  <Bookmark className="w-5 h-5" />
                </button>
              </div>
            </div>
          </div>

          {/* Featured Image */}
          <div className="mb-8 rounded-2xl overflow-hidden">
            <img
              src={article.imageUrl}
              alt={article.title}
              className="w-full h-64 md:h-96 object-cover"
            />
          </div>
        </div>
      </section>

      {/* Article Content */}
      <section className="section-padding">
        <div className="container-custom max-w-4xl">
          <div className="prose prose-lg dark:prose-invert max-w-none">
            <p className="lead text-xl text-gray-600 dark:text-gray-300 mb-8">
              {article.excerpt}
            </p>

            <div dangerouslySetInnerHTML={{ __html: article.content }} />

            {/* Tags */}
            <div className="flex flex-wrap gap-2 mt-12 pt-8 border-t border-gray-200 dark:border-gray-700">
              {article.tags.map((tag) => (
                <span
                  key={tag}
                  className="inline-flex items-center px-4 py-2 rounded-full text-sm bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300"
                >
                  <Tag className="w-3 h-3 mr-2" />
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Related Articles */}
      {relatedArticles.length > 0 && (
        <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
          <div className="container-custom max-w-4xl">
            <h2 className="text-3xl font-bold mb-8">Related Articles</h2>
            <div className="grid md:grid-cols-2 gap-6">
              {relatedArticles.map((related) => (
                <article
                  key={related.id}
                  className="bg-white dark:bg-dark-surface rounded-xl overflow-hidden card-hover"
                >
                  <div className="h-48 overflow-hidden">
                    <img
                      src={related.imageUrl}
                      alt={related.title}
                      className="w-full h-full object-cover hover:scale-110 transition-transform duration-500"
                    />
                  </div>
                  <div className="p-6">
                    <div className="flex items-center gap-3 text-sm text-gray-500 dark:text-gray-400 mb-3">
                      <span>{related.category}</span>
                      <span>•</span>
                      <span>{related.readTime}</span>
                    </div>
                    <h3 className="text-xl font-bold mb-3">
                      <a 
                        href={`/articles/${related.slug}`}
                        className="hover:text-primary-600 dark:hover:text-primary-400 transition-colors"
                      >
                        {related.title}
                      </a>
                    </h3>
                    <p className="text-gray-600 dark:text-gray-300 mb-4">
                      {related.excerpt}
                    </p>
                    <a
                      href={`/articles/${related.slug}`}
                      className="text-primary-600 dark:text-primary-400 font-medium hover:text-primary-700 dark:hover:text-primary-300"
                    >
                      Read more →
                    </a>
                  </div>
                </article>
              ))}
            </div>
          </div>
        </section>
      )}

      {/* Newsletter */}
      <section className="section-padding">
        <div className="container-custom max-w-2xl">
          <div className="bg-gradient-to-r from-primary-600 to-primary-800 rounded-3xl p-8 md:p-12 text-white text-center">
            <h2 className="text-3xl font-bold mb-6">Enjoying this article?</h2>
            <p className="text-xl mb-8 opacity-90">
              Subscribe to our newsletter for more insights and updates
            </p>
            <div className="max-w-md mx-auto flex gap-2">
              <input
                type="email"
                placeholder="Enter your email"
                className="flex-1 px-4 py-3 rounded-lg bg-white/20 backdrop-blur-sm border border-white/30 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white"
              />
              <button className="px-6 py-3 bg-white text-primary-700 rounded-lg hover:bg-gray-100 transition-colors font-medium">
                Subscribe
              </button>
            </div>
          </div>
        </div>
      </section>
    </main>
  );
}
EOF

cat > app/contact/page.tsx << 'EOF'
'use client';

import { useState } from 'react';
import { Mail, Phone, MapPin, Clock, Send, CheckCircle } from 'lucide-react';

export default function ContactPage() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    company: '',
    service: '',
    message: '',
  });

  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // In production, this would connect to your backend API
    console.log('Form submitted:', formData);
    setIsSubmitted(true);
    
    // Reset form after 3 seconds
    setTimeout(() => {
      setIsSubmitted(false);
      setFormData({
        name: '',
        email: '',
        phone: '',
        company: '',
        service: '',
        message: '',
      });
    }, 3000);
  };

  const contactInfo = [
    {
      icon: <Phone className="w-6 h-6" />,
      title: 'Phone Number',
      details: ['+62 21 1234 5678', '+62 812 3456 7890'],
      link: 'tel:+622112345678',
    },
    {
      icon: <Mail className="w-6 h-6" />,
      title: 'Email Address',
      details: ['info@ytcraft.id', 'support@ytcraft.id'],
      link: 'mailto:info@ytcraft.id',
    },
    {
      icon: <MapPin className="w-6 h-6" />,
      title: 'Office Address',
      details: ['Jl. Teknologi No. 123', 'Jakarta Selatan, Indonesia 12560'],
      link: 'https://maps.google.com',
    },
    {
      icon: <Clock className="w-6 h-6" />,
      title: 'Working Hours',
      details: ['Monday - Friday: 9:00 - 17:00', 'Saturday: 9:00 - 12:00'],
      link: null,
    },
  ];

  const services = [
    'Software Development',
    'Electronics & Machinery',
    'Laboratory Equipment',
    'Printing & Crafts',
    'Digital Products & Game',
    'Other',
  ];

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              Get in <span className="gradient-text">Touch</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Mari berdiskusi tentang bagaimana kami dapat membantu bisnis Anda berkembang dengan teknologi
            </p>
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="grid lg:grid-cols-2 gap-12">
            {/* Contact Information */}
            <div>
              <h2 className="text-3xl font-bold mb-8">Contact Information</h2>
              
              <div className="space-y-6 mb-12">
                {contactInfo.map((info, index) => (
                  <div key={index} className="flex items-start">
                    <div className="w-12 h-12 bg-primary-100 dark:bg-primary-900/30 rounded-lg flex items-center justify-center text-primary-600 dark:text-primary-400 mr-4 flex-shrink-0">
                      {info.icon}
                    </div>
                    <div>
                      <h3 className="text-lg font-bold mb-1">{info.title}</h3>
                      {info.details.map((detail, idx) => (
                        <div key={idx} className="text-gray-600 dark:text-gray-300">
                          {info.link ? (
                            <a
                              href={info.link}
                              className="hover:text-primary-600 dark:hover:text-primary-400 transition-colors"
                              target={info.link.includes('http') ? '_blank' : undefined}
                              rel={info.link.includes('http') ? 'noopener noreferrer' : undefined}
                            >
                              {detail}
                            </a>
                          ) : (
                            detail
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>

              {/* Map Placeholder */}
              <div className="bg-gray-100 dark:bg-gray-800 rounded-xl p-8 text-center">
                <div className="w-full h-48 bg-gray-200 dark:bg-gray-700 rounded-lg mb-4 flex items-center justify-center">
                  <MapPin className="w-12 h-12 text-gray-400" />
                </div>
                <p className="text-gray-600 dark:text-gray-400">
                  Visit our office in Jakarta
                </p>
              </div>
            </div>

            {/* Contact Form */}
            <div className="bg-white dark:bg-dark-surface rounded-2xl shadow-xl p-8">
              <h2 className="text-3xl font-bold mb-8">Send us a Message</h2>
              
              {isSubmitted ? (
                <div className="text-center py-12">
                  <CheckCircle className="w-16 h-16 text-green-500 mx-auto mb-6" />
                  <h3 className="text-2xl font-bold mb-4">Thank You!</h3>
                  <p className="text-gray-600 dark:text-gray-300 mb-8">
                    Your message has been sent successfully. We'll get back to you within 24 hours.
                  </p>
                  <button
                    onClick={() => setIsSubmitted(false)}
                    className="text-primary-600 dark:text-primary-400 font-medium hover:text-primary-700 dark:hover:text-primary-300"
                  >
                    Send another message
                  </button>
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="space-y-6">
                  <div className="grid md:grid-cols-2 gap-6">
                    <div>
                      <label htmlFor="name" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Full Name *
                      </label>
                      <input
                        type="text"
                        id="name"
                        name="name"
                        value={formData.name}
                        onChange={handleChange}
                        required
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="John Doe"
                      />
                    </div>
                    <div>
                      <label htmlFor="email" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Email Address *
                      </label>
                      <input
                        type="email"
                        id="email"
                        name="email"
                        value={formData.email}
                        onChange={handleChange}
                        required
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="john@example.com"
                      />
                    </div>
                  </div>

                  <div className="grid md:grid-cols-2 gap-6">
                    <div>
                      <label htmlFor="phone" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Phone Number
                      </label>
                      <input
                        type="tel"
                        id="phone"
                        name="phone"
                        value={formData.phone}
                        onChange={handleChange}
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="+62 812 3456 7890"
                      />
                    </div>
                    <div>
                      <label htmlFor="company" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Company
                      </label>
                      <input
                        type="text"
                        id="company"
                        name="company"
                        value={formData.company}
                        onChange={handleChange}
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="Your Company"
                      />
                    </div>
                  </div>

                  <div>
                    <label htmlFor="service" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Service Interested In
                    </label>
                    <select
                      id="service"
                      name="service"
                      value={formData.service}
                      onChange={handleChange}
                      className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                    >
                      <option value="">Select a service</option>
                      {services.map((service) => (
                        <option key={service} value={service}>
                          {service}
                        </option>
                      ))}
                    </select>
                  </div>

                  <div>
                    <label htmlFor="message" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Message *
                    </label>
                    <textarea
                      id="message"
                      name="message"
                      value={formData.message}
                      onChange={handleChange}
                      required
                      rows={6}
                      className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500 resize-none"
                      placeholder="Tell us about your project or inquiry..."
                    />
                  </div>

                  <button
                    type="submit"
                    className="w-full inline-flex items-center justify-center px-8 py-4 text-base font-medium text-white bg-gradient-to-r from-primary-600 to-primary-700 rounded-xl hover:from-primary-700 hover:to-primary-800 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
                  >
                    Send Message
                    <Send className="ml-2 w-5 h-5" />
                  </button>

                  <p className="text-sm text-gray-500 dark:text-gray-400 text-center">
                    By submitting this form, you agree to our Privacy Policy.
                  </p>
                </form>
              )}
            </div>
          </div>
        </div>
      </section>

      {/* FAQ */}
      <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
        <div className="container-custom max-w-4xl">
          <h2 className="text-3xl font-bold text-center mb-12">Frequently Asked Questions</h2>
          
          <div className="space-y-4">
            {[
              {
                question: 'What is your typical response time?',
                answer: 'We typically respond to inquiries within 24 hours during business days.',
              },
              {
                question: 'Do you offer custom development solutions?',
                answer: 'Yes, we specialize in custom software and hardware solutions tailored to your specific needs.',
              },
              {
                question: 'What industries do you serve?',
                answer: 'We serve various industries including manufacturing, healthcare, education, retail, and more.',
              },
              {
                question: 'Do you provide ongoing support and maintenance?',
                answer: 'Yes, we offer comprehensive support and maintenance packages for all our products and solutions.',
              },
            ].map((faq, index) => (
              <div key={index} className="bg-white dark:bg-dark-surface rounded-xl p-6 shadow-lg">
                <h3 className="text-lg font-bold mb-2">{faq.question}</h3>
                <p className="text-gray-600 dark:text-gray-300">{faq.answer}</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </main>
  );
}
EOF

# ========== README ==========
cat > README.md << 'EOF'
# CV YTCraft Indonesia - Company Profile Website

Modern company profile website for CV YTCraft Indonesia built with Next.js 14, TypeScript, and Tailwind CSS.

## 🚀 Features

- **Modern Technology Stack**: Next.js 14 (App Router), TypeScript, Tailwind CSS
- **Responsive Design**: Mobile-first approach with breakpoints for all devices
- **Dark/Light Mode**: Automatic theme switching with user preference
- **Smooth Animations**: CSS animations and transitions
- **UI Components**: Reusable components with TypeScript support
- **SEO Optimized**: Meta tags, semantic HTML, and structured data ready
- **Contact Forms**: Ready for backend integration
- **WhatsApp Integration**: Floating WhatsApp button with tooltip

## 📁 Project Structure

