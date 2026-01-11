'use client';

import { useEffect, useState } from 'react';
import { ArrowRight, Sparkles, ChevronDown } from 'lucide-react';
import Image from 'next/image';
import logofull from '../../assets/logofull.png';

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
              <div className="w-[320px] h-auto flex items-center justify-center">
                <Image
                  src={logofull}
                  alt="YTC Logo"
                  className="w-full h-auto object-contain"
                  width={320}
                  height={96}
                />
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
