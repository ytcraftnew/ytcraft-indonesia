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
