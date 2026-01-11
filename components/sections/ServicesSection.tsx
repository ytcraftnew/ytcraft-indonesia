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
