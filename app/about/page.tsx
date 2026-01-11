import { Target, Eye, Users, Award, Heart, Globe, Lightbulb, Shield } from 'lucide-react';

export default function AboutPage() {
  const coreValues = [
    {
      icon: <Lightbulb className="w-8 h-8" />,
      title: 'Innovation',
      description: 'Terus berinovasi dalam teknologi dan solusi',
    },
    {
      icon: <Heart className="w-8 h-8" />,
      title: 'Excellence',
      description: 'Komitmen terhadap kualitas terbaik',
    },
    {
      icon: <Users className="w-8 h-8" />,
      title: 'Collaboration',
      description: 'Bekerja sama untuk hasil optimal',
    },
    {
      icon: <Shield className="w-8 h-8" />,
      title: 'Integrity',
      description: 'Transparansi dan kejujuran dalam setiap langkah',
    },
  ];

  return (
    <main>
      {/* Hero */}
      <section className="section-padding bg-gradient-to-b from-white to-gray-50 dark:from-dark-bg dark:to-gray-900">
        <div className="container-custom">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl md:text-6xl font-bold mb-6">
              About <span className="gradient-text">YTCraft</span>
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300">
              Perusahaan teknologi yang mengkombinasikan kreativitas dengan keahlian teknis untuk menciptakan solusi inovatif.
            </p>
          </div>
        </div>
      </section>

      {/* Vision & Mission */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="grid md:grid-cols-2 gap-12">
            {/* Vision */}
            <div className="bg-white dark:bg-dark-surface rounded-2xl p-8 shadow-lg card-hover">
              <div className="flex items-center mb-6">
                <div className="w-12 h-12 bg-primary-100 dark:bg-primary-900/30 rounded-lg flex items-center justify-center mr-4">
                  <Eye className="w-6 h-6 text-primary-600 dark:text-primary-400" />
                </div>
                <h2 className="text-2xl font-bold">Our Vision</h2>
              </div>
              <p className="text-gray-600 dark:text-gray-300">
                Menjadi perusahaan teknologi terdepan di Indonesia yang menginspirasi inovasi dan menciptakan solusi berkelanjutan untuk masa depan yang lebih baik.
              </p>
            </div>

            {/* Mission */}
            <div className="bg-white dark:bg-dark-surface rounded-2xl p-8 shadow-lg card-hover">
              <div className="flex items-center mb-6">
                <div className="w-12 h-12 bg-primary-100 dark:bg-primary-900/30 rounded-lg flex items-center justify-center mr-4">
                  <Target className="w-6 h-6 text-primary-600 dark:text-primary-400" />
                </div>
                <h2 className="text-2xl font-bold">Our Mission</h2>
              </div>
              <ul className="space-y-3 text-gray-600 dark:text-gray-300">
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Mengembangkan teknologi yang memecahkan masalah nyata
                </li>
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Memberikan solusi berkualitas tinggi dengan nilai terbaik
                </li>
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Membangun ekosistem teknologi yang berkelanjutan
                </li>
                <li className="flex items-start">
                  <span className="text-primary-500 mr-2">•</span>
                  Memberdayakan masyarakat melalui pendidikan teknologi
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      {/* Core Values */}
      <section className="section-padding bg-gray-50 dark:bg-gray-900/50">
        <div className="container-custom">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold mb-4">Core Values</h2>
            <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
              Nilai-nilai yang membimbing setiap keputusan dan tindakan kami
            </p>
          </div>

          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {coreValues.map((value, index) => (
              <div
                key={index}
                className="bg-white dark:bg-dark-surface rounded-xl p-6 text-center shadow-lg card-hover animate-slide-up"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <div className="w-16 h-16 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
                  <div className="text-primary-600 dark:text-primary-400">
                    {value.icon}
                  </div>
                </div>
                <h3 className="text-xl font-bold mb-2">{value.title}</h3>
                <p className="text-gray-600 dark:text-gray-300">
                  {value.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Brand Philosophy */}
      <section className="section-padding">
        <div className="container-custom">
          <div className="max-w-4xl mx-auto">
            <div className="text-center mb-12">
              <h2 className="text-3xl md:text-4xl font-bold mb-4">
                Brand Philosophy
              </h2>
              <div className="w-24 h-1 bg-gradient-to-r from-primary-500 to-primary-700 mx-auto rounded-full" />
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white dark:from-primary-900/20 dark:to-dark-surface rounded-2xl p-8 md:p-12 shadow-xl">
              <blockquote className="text-2xl md:text-3xl font-medium text-gray-800 dark:text-white mb-6 text-center">
                "Technology is not just about what it can do, but about what it can enable people to do."
              </blockquote>
              <p className="text-gray-600 dark:text-gray-300 text-center">
                Di YTCraft, kami percaya bahwa teknologi terbaik adalah yang memberdayakan, menginspirasi, dan menciptakan nilai nyata bagi pengguna. Setiap proyek adalah kesempatan untuk menciptakan sesuatu yang berarti.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Team Stats */}
      <section className="section-padding bg-gradient-to-r from-primary-600 to-primary-800 text-white">
        <div className="container-custom">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            {[
              { value: '15+', label: 'Expert Engineers' },
              { value: '8', label: 'Departments' },
              { value: '5000+', label: 'Hours of Expertise' },
              { value: '100%', label: 'Dedication' },
            ].map((stat, index) => (
              <div key={index} className="animate-slide-up" style={{ animationDelay: `${index * 100}ms` }}>
                <div className="text-4xl font-bold mb-2">{stat.value}</div>
                <div className="opacity-90">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </main>
  );
}
