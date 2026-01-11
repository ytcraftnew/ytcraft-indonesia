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
