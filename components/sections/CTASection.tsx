'use client';

import { ArrowRight, MessageSquare, Calendar, Users } from 'lucide-react';

export default function CTASection() {
  return (
    <section className="section-padding bg-gradient-to-br from-primary-600 to-primary-800">
      <div className="container-custom">
        <div className="max-w-4xl mx-auto text-center text-white">
          <h2 className="text-3xl md:text-5xl font-bold mb-6">
            Ready to Transform Your Business?
          </h2>
          <p className="text-xl mb-10 opacity-90">
            Mari berdiskusi tentang solusi teknologi yang tepat untuk kebutuhan Anda
          </p>

          <div className="grid md:grid-cols-3 gap-6 mb-12">
            {[
              {
                icon: <MessageSquare className="w-8 h-8" />,
                title: 'Free Consultation',
                desc: 'Diskusi tanpa biaya dengan tim ahli kami',
              },
              {
                icon: <Calendar className="w-8 h-8" />,
                title: 'Flexible Schedule',
                desc: 'Atur jadwal sesuai kenyamanan Anda',
              },
              {
                icon: <Users className="w-8 h-8" />,
                title: 'Dedicated Team',
                desc: 'Tim khusus akan mendampingi proyek Anda',
              },
            ].map((item, index) => (
              <div
                key={index}
                className="bg-white/10 backdrop-blur-sm rounded-xl p-6 border border-white/20 animate-slide-up"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <div className="flex justify-center mb-4">
                  <div className="w-16 h-16 rounded-full bg-white/20 flex items-center justify-center">
                    {item.icon}
                  </div>
                </div>
                <h3 className="text-xl font-bold mb-2">{item.title}</h3>
                <p className="opacity-80">{item.desc}</p>
              </div>
            ))}
          </div>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="/contact"
              className="group inline-flex items-center justify-center px-8 py-4 text-base font-medium text-primary-700 bg-white rounded-xl hover:bg-gray-100 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
            >
              Get Started Now
              <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
            </a>
            <a
              href="https://wa.me/6285117010818?text=Hello%20YTCraft%2C%20I%20would%20like%20to%20know%20more%20about%20your%20services"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center px-8 py-4 text-base font-medium text-white bg-green-600 rounded-xl hover:bg-green-700 transition-all duration-300 hover:scale-105 border-2 border-white/30"
            >
              Chat on WhatsApp
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}
