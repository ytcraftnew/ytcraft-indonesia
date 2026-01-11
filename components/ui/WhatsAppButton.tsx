'use client';

import { MessageCircle } from 'lucide-react';
import { useState } from 'react';

export default function WhatsAppButton() {
  const [isHovered, setIsHovered] = useState(false);

  const phoneNumber = '+6281234567890';
  const message = 'Hello YTCraft, I would like to know more about your services';

  const whatsappUrl = `https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`;

  return (
    <div className="fixed bottom-6 right-6 z-50">
      <a
        href={whatsappUrl}
        target="_blank"
        rel="noopener noreferrer"
        className="block"
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
      >
        {/* Floating Button */}
        <div className="relative">
          <div className="w-14 h-14 bg-gradient-to-br from-green-500 to-green-600 rounded-full flex items-center justify-center shadow-xl hover:shadow-2xl transition-all duration-300 hover:scale-110">
            <MessageCircle className="w-7 h-7 text-white" />
          </div>
          
          {/* Notification Badge */}
          <div className="absolute -top-1 -right-1">
            <div className="w-5 h-5 bg-red-500 rounded-full flex items-center justify-center">
              <span className="text-white text-xs font-bold">1</span>
            </div>
          </div>

          {/* Tooltip */}
          {isHovered && (
            <div className="absolute right-16 bottom-1/2 transform translate-y-1/2 animate-slide-up">
              <div className="bg-gray-900 text-white px-4 py-2 rounded-lg whitespace-nowrap shadow-xl">
                <div className="text-sm font-medium">Chat with us!</div>
                <div className="text-xs text-gray-300">Typically replies within minutes</div>
              </div>
              <div className="absolute right-0 top-1/2 transform translate-x-1/2 -translate-y-1/2 rotate-45 w-3 h-3 bg-gray-900" />
            </div>
          )}
        </div>
      </a>
    </div>
  );
}
