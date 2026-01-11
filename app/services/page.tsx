import { services } from '@/data/services';
import { CheckCircle, ArrowRight } from 'lucide-react';

export default function ServicesPage() {
  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              Our <span className="gradient-text">Services</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Solusi teknologi komprehensif yang dirancang untuk mendukung pertumbuhan bisnis Anda
            </p>
          </div>
        </div>
      </section>

      {/* Services List */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="space-y-12">
            {services.map((service, index) => (
              <div
                key={service.id}
                className={`flex flex-col lg:flex-row gap-8 items-center ${
                  index % 2 === 1 ? 'lg:flex-row-reverse' : ''
                }`}
              >
                {/* Icon/Image */}
                <div className="lg:w-1/3">
                  <div className="w-48 h-48 mx-auto bg-gradient-to-br from-primary-500/20 to-primary-600/20 rounded-3xl flex items-center justify-center">
                    <div className="text-6xl">{service.icon}</div>
                  </div>
                </div>

                {/* Content */}
                <div className="lg:w-2/3">
                  <div className="inline-flex items-center px-4 py-2 rounded-full bg-primary-100 dark:bg-primary-900/30 text-primary-700 dark:text-primary-400 text-sm font-medium mb-4">
                    Service {index + 1}
                  </div>
                  <h2 className="text-3xl font-bold mb-4">{service.title}</h2>
                  <p className="text-gray-600 dark:text-gray-300 mb-6">
                    {service.description}
                  </p>

                  <div className="grid sm:grid-cols-2 gap-4 mb-8">
                    {service.features.map((feature, idx) => (
                      <div key={idx} className="flex items-center">
                        <CheckCircle className="w-5 h-5 text-primary-500 mr-3 flex-shrink-0" />
                        <span className="text-gray-700 dark:text-gray-300">{feature}</span>
                      </div>
                    ))}
                  </div>

                  <a
                    href="/contact"
                    className="inline-flex items-center text-primary-600 dark:text-primary-400 font-medium hover:text-primary-700 dark:hover:text-primary-300 group"
                  >
                    Request this service
                    <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
                  </a>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Process */}
      <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
        <div className="container-custom">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold mb-4">Our Process</h2>
            <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
              Metodologi terstruktur yang memastikan keberhasilan proyek
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-8">
            {[
              { step: '01', title: 'Discovery', desc: 'Analisis kebutuhan dan tujuan' },
              { step: '02', title: 'Planning', desc: 'Rencana dan strategi implementasi' },
              { step: '03', title: 'Development', desc: 'Eksekusi dan pengembangan' },
              { step: '04', title: 'Delivery', desc: 'Implementasi dan dukungan' },
            ].map((process, index) => (
              <div key={index} className="text-center">
                <div className="w-16 h-16 bg-gradient-to-br from-primary-500 to-primary-700 rounded-full flex items-center justify-center text-white text-xl font-bold mb-4 mx-auto">
                  {process.step}
                </div>
                <h3 className="text-xl font-bold mb-2">{process.title}</h3>
                <p className="text-gray-600 dark:text-gray-300">{process.desc}</p>
              </div>
            ))}
          </div>
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
              Konsultasikan kebutuhan teknologi Anda dengan tim ahli kami
            </p>
            <a
              href="/contact"
              className="inline-flex items-center justify-center px-8 py-4 text-base font-medium text-primary-700 bg-white rounded-xl hover:bg-gray-100 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
            >
              Schedule a Consultation
              <ArrowRight className="ml-2 w-5 h-5" />
            </a>
          </div>
        </div>
      </section>
    </main>
  );
}
