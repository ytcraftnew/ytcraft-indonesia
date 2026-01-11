'use client';

import { useState } from 'react';
import { Mail, Phone, MapPin, Clock, Send, CheckCircle } from 'lucide-react';

export default function ContactPage() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    company: '',
    service: '',
    message: '',
  });

  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // In production, this would connect to your backend API
    console.log('Form submitted:', formData);
    setIsSubmitted(true);
    
    // Reset form after 3 seconds
    setTimeout(() => {
      setIsSubmitted(false);
      setFormData({
        name: '',
        email: '',
        phone: '',
        company: '',
        service: '',
        message: '',
      });
    }, 3000);
  };

  const contactInfo = [
    {
      icon: <Phone className="w-6 h-6" />,
      title: 'Phone Number',
      details: ['+62 851 1701 0818'],
      link: 'tel:+6285117010818',
    },
    {
      icon: <Mail className="w-6 h-6" />,
      title: 'Email Address',
      details: ['cv.ytcraftindonesia@gmail.com'],
      link: 'mailto:cv.ytcraftindonesia@gmail.com',
    },
    {
      icon: <MapPin className="w-6 h-6" />,
      title: 'Office Address',
      details: ['Jl. Perumahan Taman Gading Blok Q 17, Tumpengsari, Tegal Besar, Kec. Kaliwates, Kabupaten Jember, Jawa Timur 68132, Indonesia'],
      link: 'https://maps.app.goo.gl/VZUTgBswsZu8keqE9',
    },
    {
      icon: <Clock className="w-6 h-6" />,
      title: 'Working Hours',
      details: ['Monday - Saturday: Open 24 Hours', 'Sunday: Closed'],
      link: null,
    },
  ];

  const services = [
    'Software Development',
    'Electronics & Machinery',
    'Laboratory Equipment',
    'Printing & Crafts',
    'Digital Products & Game',
    'Other',
  ];

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              Get in <span className="gradient-text">Touch</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Mari berdiskusi tentang bagaimana kami dapat membantu bisnis Anda berkembang dengan teknologi
            </p>
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="grid lg:grid-cols-2 gap-12">
            {/* Contact Information */}
            <div>
              <h2 className="text-3xl font-bold mb-8">Contact Information</h2>
              
              <div className="space-y-6 mb-12">
                {contactInfo.map((info, index) => (
                  <div key={index} className="flex items-start">
                    <div className="w-12 h-12 bg-primary-100 dark:bg-primary-900/30 rounded-lg flex items-center justify-center text-primary-600 dark:text-primary-400 mr-4 flex-shrink-0">
                      {info.icon}
                    </div>
                    <div>
                      <h3 className="text-lg font-bold mb-1">{info.title}</h3>
                      {info.details.map((detail, idx) => (
                        <div key={idx} className="text-gray-600 dark:text-gray-300">
                          {info.link ? (
                            <a
                              href={info.link}
                              className="hover:text-primary-600 dark:hover:text-primary-400 transition-colors"
                              target={info.link.includes('http') ? '_blank' : undefined}
                              rel={info.link.includes('http') ? 'noopener noreferrer' : undefined}
                            >
                              {detail}
                            </a>
                          ) : (
                            detail
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>

              {/* Map */}
              <div className="bg-gray-100 dark:bg-gray-800 rounded-xl overflow-hidden h-96 shadow-lg">
                <iframe
                  title="Office Location"
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4977.412417805335!2d113.7060358!3d-8.2005957!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd6974bf76dd79d%3A0x37820cb73f4adf!2sCV.%20YtCraft%20Indonesia!5e1!3m2!1sid!2sid!4v1767286410533!5m2!1sid!2sid"
                  width="100%"
                  height="100%"
                  style={{ border: 0 }}
                  allowFullScreen
                  loading="lazy"
                  referrerPolicy="no-referrer-when-downgrade"
                ></iframe>
              </div>
            </div>

            {/* Contact Form */}
            <div className="bg-white dark:bg-dark-surface rounded-2xl shadow-xl p-8">
              <h2 className="text-3xl font-bold mb-8">Send us a Message</h2>
              
              {isSubmitted ? (
                <div className="text-center py-12">
                  <CheckCircle className="w-16 h-16 text-green-500 mx-auto mb-6" />
                  <h3 className="text-2xl font-bold mb-4">Thank You!</h3>
                  <p className="text-gray-600 dark:text-gray-300 mb-8">
                    Your message has been sent successfully. We'll get back to you within 24 hours.
                  </p>
                  <button
                    onClick={() => setIsSubmitted(false)}
                    className="text-primary-600 dark:text-primary-400 font-medium hover:text-primary-700 dark:hover:text-primary-300"
                  >
                    Send another message
                  </button>
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="space-y-6">
                  <div className="grid md:grid-cols-2 gap-6">
                    <div>
                      <label htmlFor="name" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Full Name *
                      </label>
                      <input
                        type="text"
                        id="name"
                        name="name"
                        value={formData.name}
                        onChange={handleChange}
                        required
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="John Doe"
                      />
                    </div>
                    <div>
                      <label htmlFor="email" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Email Address *
                      </label>
                      <input
                        type="email"
                        id="email"
                        name="email"
                        value={formData.email}
                        onChange={handleChange}
                        required
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="john@example.com"
                      />
                    </div>
                  </div>

                  <div className="grid md:grid-cols-2 gap-6">
                    <div>
                      <label htmlFor="phone" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Phone Number
                      </label>
                      <input
                        type="tel"
                        id="phone"
                        name="phone"
                        value={formData.phone}
                        onChange={handleChange}
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="+62 812 3456 7890"
                      />
                    </div>
                    <div>
                      <label htmlFor="company" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                        Company
                      </label>
                      <input
                        type="text"
                        id="company"
                        name="company"
                        value={formData.company}
                        onChange={handleChange}
                        className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                        placeholder="Your Company"
                      />
                    </div>
                  </div>

                  <div>
                    <label htmlFor="service" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Service Interested In
                    </label>
                    <select
                      id="service"
                      name="service"
                      value={formData.service}
                      onChange={handleChange}
                      className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500"
                    >
                      <option value="">Select a service</option>
                      {services.map((service) => (
                        <option key={service} value={service}>
                          {service}
                        </option>
                      ))}
                    </select>
                  </div>

                  <div>
                    <label htmlFor="message" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Message *
                    </label>
                    <textarea
                      id="message"
                      name="message"
                      value={formData.message}
                      onChange={handleChange}
                      required
                      rows={6}
                      className="w-full px-4 py-3 rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-primary-500 resize-none"
                      placeholder="Tell us about your project or inquiry..."
                    />
                  </div>

                  <button
                    type="submit"
                    className="w-full inline-flex items-center justify-center px-8 py-4 text-base font-medium text-white bg-gradient-to-r from-primary-600 to-primary-700 rounded-xl hover:from-primary-700 hover:to-primary-800 transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-xl"
                  >
                    Send Message
                    <Send className="ml-2 w-5 h-5" />
                  </button>

                  <p className="text-sm text-gray-500 dark:text-gray-400 text-center">
                    By submitting this form, you agree to our Privacy Policy.
                  </p>
                </form>
              )}
            </div>
          </div>
        </div>
      </section>

      {/* FAQ */}
      <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
        <div className="container-custom max-w-4xl">
          <h2 className="text-3xl font-bold text-center mb-12">Frequently Asked Questions</h2>
          
          <div className="space-y-4">
            {[
              {
                question: 'What is your typical response time?',
                answer: 'We typically respond to inquiries within 24 hours during business days.',
              },
              {
                question: 'Do you offer custom development solutions?',
                answer: 'Yes, we specialize in custom software and hardware solutions tailored to your specific needs.',
              },
              {
                question: 'What industries do you serve?',
                answer: 'We serve various industries including manufacturing, healthcare, education, retail, and more.',
              },
              {
                question: 'Do you provide ongoing support and maintenance?',
                answer: 'Yes, we offer comprehensive support and maintenance packages for all our products and solutions.',
              },
            ].map((faq, index) => (
              <div key={index} className="bg-white dark:bg-dark-surface rounded-xl p-6 shadow-lg">
                <h3 className="text-lg font-bold mb-2">{faq.question}</h3>
                <p className="text-gray-600 dark:text-gray-300">{faq.answer}</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </main>
  );
}
