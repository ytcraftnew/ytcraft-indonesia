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
    url: 'https://cv.ytcraft.qzz.io',
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
