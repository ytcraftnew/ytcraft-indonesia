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
