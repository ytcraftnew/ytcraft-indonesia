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
