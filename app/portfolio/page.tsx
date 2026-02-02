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
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnk3NAJnWP3gUMPX71GUeASchrGw387VsQcw&s',
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
