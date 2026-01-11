import { ReactNode } from 'react';

interface CardProps {
  children: ReactNode;
  className?: string;
  hover?: boolean;
}

export default function Card({ children, className = '', hover = true }: CardProps) {
  return (
    <div className={`
      bg-white dark:bg-dark-surface rounded-xl shadow-lg 
      ${hover ? 'card-hover' : ''}
      ${className}
    `}>
      {children}
    </div>
  );
}
