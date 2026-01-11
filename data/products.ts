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
