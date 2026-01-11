import Link from "next/link";
import {
  Facebook,
  Instagram,
  Linkedin,
  Twitter,
  Mail,
  Phone,
  MapPin,
} from "lucide-react";
import Image from "next/image";
import logo from "../../assets/logo.png";

export default function Footer() {
  const currentYear = new Date().getFullYear();

  return (
    <footer className="bg-gray-900 text-white">
      <div className="container-custom">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 py-12">
          {/* Company Info */}
          <div>
            <div className="flex items-center space-x-2 mb-4">
              <div className="w-15 h-15 from-primary-500 to-primary-700 rounded-lg flex items-center justify-center">
                <Image
                  src={logo}
                  alt="YTC Logo"
                  className="w-12 h-12 object-contain"
                  width={24}
                  height={24}
                />
              </div>
              <div>
                <h2 className="text-lg font-bold">CV. YtCraft Indonesia</h2>
                <p className="text-sm text-gray-400">
                  Crafting the Future with Technology
                </p>
              </div>
            </div>
            <p className="text-gray-400 mb-6">
              Perusahaan teknologi inovatif yang berfokus pada pengembangan
              solusi digital dan produk fisik berkualitas tinggi.
            </p>
            <div className="flex space-x-4">
              <a
                href="#"
                className="text-gray-400 hover:text-primary-400 transition-colors"
              >
                <Facebook className="w-5 h-5" />
              </a>
              <a
                href="#"
                className="text-gray-400 hover:text-primary-400 transition-colors"
              >
                <Twitter className="w-5 h-5" />
              </a>
              <a
                href="#"
                className="text-gray-400 hover:text-primary-400 transition-colors"
              >
                <Instagram className="w-5 h-5" />
              </a>
              <a
                href="#"
                className="text-gray-400 hover:text-primary-400 transition-colors"
              >
                <Linkedin className="w-5 h-5" />
              </a>
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="text-lg font-bold mb-6">Quick Links</h3>
            <ul className="space-y-3">
              <li>
                <Link
                  href="/about"
                  className="text-gray-400 hover:text-primary-400 transition-colors"
                >
                  About Us
                </Link>
              </li>
              <li>
                <Link
                  href="/services"
                  className="text-gray-400 hover:text-primary-400 transition-colors"
                >
                  Our Services
                </Link>
              </li>
              <li>
                <Link
                  href="/portfolio"
                  className="text-gray-400 hover:text-primary-400 transition-colors"
                >
                  Portfolio
                </Link>
              </li>
              <li>
                <Link
                  href="/articles"
                  className="text-gray-400 hover:text-primary-400 transition-colors"
                >
                  Articles
                </Link>
              </li>
              <li>
                <Link
                  href="/contact"
                  className="text-gray-400 hover:text-primary-400 transition-colors"
                >
                  Contact Us
                </Link>
              </li>
            </ul>
          </div>

          {/* Services */}
          <div>
            <h3 className="text-lg font-bold mb-6">Our Services</h3>
            <ul className="space-y-3">
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Software Development
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Electronics & Machinery
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Laboratory Equipment
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Printing & Crafts
                </span>
              </li>
              <li>
                <span className="text-gray-400 hover:text-primary-400 transition-colors cursor-pointer">
                  Digital Products
                </span>
              </li>
            </ul>
          </div>

          {/* Contact Info */}
          <div>
            <h3 className="text-lg font-bold mb-6">Contact Info</h3>
            <ul className="space-y-4">
              
              <li className="flex items-start space-x-3">
                <MapPin className="w-5 h-5 text-primary-400 shrink-0" />
                <p className="text-gray-400">
                  Jl. Perumahan Taman Gading Blok Q 17, Tumpengsari, Tegal
                  Besar, Kec. Kaliwates, Kabupaten Jember, Jawa Timur 68132
                  <br />
                  Indonesia
                </p>
              </li>

              <li className="flex items-center space-x-3">
                <Phone className="w-5 h-5 text-primary-400" />
                <a
                  href="https://wa.me/+6285117010818?text=Hello%20YTCraft%2C%20I%20would%20like%20to%20know%20more%20about%20your%20services"
                  className="text-gray-400 hover:text-primary-400 transition-colors"
                >
                  +62 851 1701 0818
                </a>
              </li>
              <li className="flex items-center space-x-3">
                <Mail className="w-5 h-5 text-primary-400" />
                <a
                  href="mailto:cv.ytcraftindonesia@gmail.com"
                  className="text-gray-400 hover:text-primary-400 transition-colors"
                >
                  cv.ytcraftindonesia@gmail.com
                </a>
              </li>
            </ul>
          </div>
        </div>

        {/* Copyright */}
        <div className="border-t border-gray-800 py-6">
          <div className="flex flex-col md:flex-row justify-between items-center">
            <p className="text-gray-400 text-sm">
              © 2025 - {currentYear} CV YTCraft Indonesia. All rights reserved.
            </p>
            <div className="flex space-x-6 mt-4 md:mt-0">
              <Link
                href="/privacy"
                className="text-sm text-gray-400 hover:text-primary-400 transition-colors"
              >
                Privacy Policy
              </Link>
              <Link
                href="/terms"
                className="text-sm text-gray-400 hover:text-primary-400 transition-colors"
              >
                Terms of Service
              </Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
