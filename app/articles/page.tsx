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
