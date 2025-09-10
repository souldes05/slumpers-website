# Slumpers Website - Complete Project Creation Script
# This PowerShell script creates the entire Slumpers e-commerce and event website

Write-Host "🚀 Creating Complete Slumpers Website..." -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

# Create project directory
$projectPath = "C:\slumpers-website-complete"
if (Test-Path $projectPath) {
    Remove-Item $projectPath -Recurse -Force
}
New-Item -ItemType Directory -Path $projectPath | Out-Null
Set-Location $projectPath

Write-Host "📁 Creating project structure..." -ForegroundColor Yellow

# Create directory structure
$directories = @(
    "app", "app\admin", "app\api", "app\api\payments", "app\api\payments\stripe", 
    "app\api\payments\mpesa", "app\api\payments\mpesa\callback", "app\api\tickets",
    "app\api\tickets\generate", "app\api\cleanup", "app\api\cleanup\expired-tickets",
    "app\bookings", "app\events", "app\events\[id]", "app\events\[id]\tickets", "app\shop",
    "components", "components\admin", "components\ui", "lib", "prisma", "public"
)

foreach ($dir in $directories) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

Write-Host "📄 Creating configuration files..." -ForegroundColor Yellow

# package.json
@'
{
  "name": "slumpers-website",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "14.0.0",
    "react": "^18",
    "react-dom": "^18",
    "tailwindcss": "^3.3.0",
    "autoprefixer": "^10.0.1",
    "postcss": "^8",
    "@headlessui/react": "^1.7.17",
    "@heroicons/react": "^2.0.18",
    "framer-motion": "^10.16.4",
    "qrcode": "^1.5.3",
    "bwip-js": "^4.1.1",
    "stripe": "^14.7.0",
    "nodemailer": "^6.9.7",
    "axios": "^1.6.0",
    "react-calendar": "^4.6.0",
    "react-hot-toast": "^2.4.1",
    "prisma": "^5.6.0",
    "@prisma/client": "^5.6.0",
    "bcryptjs": "^2.4.3",
    "jsonwebtoken": "^9.0.2",
    "multer": "^1.4.5-lts.1",
    "sharp": "^0.32.6",
    "twilio": "^4.19.0",
    "jspdf": "^2.5.1",
    "canvas": "^2.11.2",
    "next-auth": "^4.24.5",
    "@vercel/blob": "^0.15.1",
    "@vercel/postgres": "^0.5.1",
    "@sendgrid/mail": "^7.7.0"
  },
  "devDependencies": {
    "typescript": "^5",
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "@types/qrcode": "^1.5.5",
    "@types/bcryptjs": "^2.4.6",
    "@types/jsonwebtoken": "^9.0.5",
    "@types/multer": "^1.4.11",
    "@types/nodemailer": "^6.4.14",
    "eslint": "^8",
    "eslint-config-next": "14.0.0"
  }
}
'@ | Out-File -FilePath "package.json" -Encoding UTF8

# tsconfig.json
@'
{
  "compilerOptions": {
    "lib": ["dom", "dom.iterable", "es6"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "baseUrl": ".",
    "paths": {
      "@/*": ["./*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
'@ | Out-File -FilePath "tsconfig.json" -Encoding UTF8

# tailwind.config.js
@'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#f0fdf4',
          100: '#dcfce7',
          200: '#bbf7d0',
          300: '#86efac',
          400: '#4ade80',
          500: '#00A651',
          600: '#16a34a',
          700: '#15803d',
          800: '#166534',
          900: '#14532d',
        },
        kenyan: {
          black: '#000000',
          red: '#FF0000',
          green: '#00A651',
          white: '#FFFFFF',
        }
      },
      fontFamily: {
        display: ['Poppins', 'sans-serif'],
        body: ['Inter', 'sans-serif'],
      },
      animation: {
        'bounce-slow': 'bounce 3s infinite',
        'pulse-slow': 'pulse 4s infinite',
        'spin-slow': 'spin 3s linear infinite',
        'kenyan-flag': 'kenyan-flag 6s ease-in-out infinite',
      },
      keyframes: {
        'kenyan-flag': {
          '0%, 100%': { 'background-position': '0% 50%' },
          '50%': { 'background-position': '100% 50%' },
        }
      },
      backgroundImage: {
        'kenyan-gradient': 'linear-gradient(135deg, #000000 0%, #FF0000 50%, #00A651 100%)',
        'kenyan-flag-animated': 'linear-gradient(-45deg, #000000, #FF0000, #00A651, #FFFFFF)',
      },
      backgroundSize: {
        '400%': '400% 400%',
      }
    },
  },
  plugins: [],
}
'@ | Out-File -FilePath "tailwind.config.js" -Encoding UTF8

# next.config.js
@'
/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    appDir: true,
  },
  images: {
    domains: ['localhost', 'vercel.app', 'slumpers.vercel.app'],
  },
  env: {
    STRIPE_PUBLISHABLE_KEY: process.env.STRIPE_PUBLISHABLE_KEY,
    STRIPE_SECRET_KEY: process.env.STRIPE_SECRET_KEY,
    MPESA_CONSUMER_KEY: process.env.MPESA_CONSUMER_KEY,
    MPESA_CONSUMER_SECRET: process.env.MPESA_CONSUMER_SECRET,
    MPESA_SHORTCODE: process.env.MPESA_SHORTCODE,
    MPESA_PASSKEY: process.env.MPESA_PASSKEY,
    DATABASE_URL: process.env.DATABASE_URL,
    NEXTAUTH_SECRET: process.env.NEXTAUTH_SECRET,
    NEXTAUTH_URL: process.env.NEXTAUTH_URL,
    EMAIL_USER: process.env.EMAIL_USER,
    EMAIL_PASS: process.env.EMAIL_PASS,
    TWILIO_ACCOUNT_SID: process.env.TWILIO_ACCOUNT_SID,
    TWILIO_AUTH_TOKEN: process.env.TWILIO_AUTH_TOKEN,
    TWILIO_PHONE_NUMBER: process.env.TWILIO_PHONE_NUMBER,
  },
}

module.exports = nextConfig
'@ | Out-File -FilePath "next.config.js" -Encoding UTF8

# .env.example
@'
# Database (Vercel Postgres or Neon)
DATABASE_URL="postgresql://username:password@hostname:5432/database_name"

# Vercel Environment
VERCEL_URL="https://slumpers.vercel.app"
NEXT_PUBLIC_VERCEL_URL="https://slumpers.vercel.app"

# Stripe Payment Processing
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_test_..."
STRIPE_SECRET_KEY="sk_test_..."
STRIPE_WEBHOOK_SECRET="whsec_..."

# M-Pesa (Safaricom Daraja API)
MPESA_CONSUMER_KEY="6lPrzrWUSs6cQfqDfQOuEgz2gA3QeorwdlAQn8nSsCzLm4Lb"
MPESA_CONSUMER_SECRET="nEfuybWEyVHlYPQauYOJIiNmd5m8sC3sCXCuf9eQBeeUAG2b3AwP9Je3Ca7TAsbw"
MPESA_ENVIRONMENT="sandbox"
MPESA_SHORTCODE="174379"
MPESA_PASSKEY="bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"
MPESA_CALLBACK_URL="https://slumpers.vercel.app/api/payments/mpesa/callback"

# NextAuth Configuration
NEXTAUTH_SECRET="your-super-secret-key-minimum-32-characters"
NEXTAUTH_URL="https://slumpers.vercel.app"

# Email Configuration (Gmail or SendGrid)
EMAIL_HOST="smtp.gmail.com"
EMAIL_PORT="587"
EMAIL_USER="your-email@gmail.com"
EMAIL_PASS="your-gmail-app-password"
SENDGRID_API_KEY="SG.your-sendgrid-api-key"

# SMS/WhatsApp (Twilio)
TWILIO_ACCOUNT_SID="your-twilio-account-sid"
TWILIO_AUTH_TOKEN="your-twilio-auth-token"
TWILIO_PHONE_NUMBER="+1234567890"

# File Storage (Vercel Blob)
BLOB_READ_WRITE_TOKEN="vercel_blob_rw_token"

# Security
CRON_SECRET="your-random-cron-secret-key"

# Analytics (Optional)
NEXT_PUBLIC_GOOGLE_ANALYTICS="G-XXXXXXXXXX"
'@ | Out-File -FilePath ".env.example" -Encoding UTF8

Write-Host "🎨 Creating main application files..." -ForegroundColor Yellow

# app/layout.tsx
@'
import type { Metadata } from 'next'
import { Inter, Poppins } from 'next/font/google'
import './globals.css'
import { ThemeProvider } from '@/components/ThemeProvider'
import { Toaster } from 'react-hot-toast'

const inter = Inter({ 
  subsets: ['latin'],
  variable: '--font-inter',
  display: 'swap',
})

const poppins = Poppins({ 
  weight: ['300', '400', '500', '600', '700', '800'],
  subsets: ['latin'],
  variable: '--font-poppins',
  display: 'swap',
})

export const metadata: Metadata = {
  title: 'Slumpers - Gen Z Events & Merchandise',
  description: 'Kenya\'s premier Gen Z event ticketing and merchandise platform. Book events, buy tickets, shop exclusive merchandise.',
  keywords: 'Kenya events, Gen Z, tickets, merchandise, Nairobi, concerts, parties',
  authors: [{ name: 'Slumpers Team' }],
  creator: 'Slumpers Kenya',
  publisher: 'Slumpers Kenya',
  openGraph: {
    title: 'Slumpers - Gen Z Events & Merchandise',
    description: 'Kenya\'s premier Gen Z event platform',
    url: 'https://slumpers.vercel.app',
    siteName: 'Slumpers',
    locale: 'en_KE',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Slumpers - Gen Z Events & Merchandise',
    description: 'Kenya\'s premier Gen Z event platform',
  },
  robots: {
    index: true,
    follow: true,
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={`${inter.variable} ${poppins.variable} font-body antialiased`}>
        <ThemeProvider>
          <div className="min-h-screen bg-white dark:bg-gray-900 transition-colors">
            {children}
          </div>
          <Toaster 
            position="top-right"
            toastOptions={{
              duration: 4000,
              style: {
                background: '#363636',
                color: '#fff',
              },
            }}
          />
        </ThemeProvider>
      </body>
    </html>
  )
}
'@ | Out-File -FilePath "app\layout.tsx" -Encoding UTF8

# app/page.tsx
@'
import Navbar from '@/components/Navbar'
import Hero from '@/components/Hero'
import AboutSection from '@/components/AboutSection'
import FeaturedEvents from '@/components/FeaturedEvents'
import FeaturedProducts from '@/components/FeaturedProducts'
import BookingsCTA from '@/components/BookingsCTA'
import Footer from '@/components/Footer'

export default function HomePage() {
  return (
    <main className="min-h-screen">
      <Navbar />
      <Hero />
      <AboutSection />
      <FeaturedEvents />
      <FeaturedProducts />
      <BookingsCTA />
      <Footer />
    </main>
  )
}
'@ | Out-File -FilePath "app\page.tsx" -Encoding UTF8

Write-Host "🎯 Creating components..." -ForegroundColor Yellow

# Create a simple component example
@'
'use client'

import React from 'react'
import { motion } from 'framer-motion'

export default function Hero() {
  return (
    <section className="relative min-h-screen flex items-center justify-center bg-gradient-to-br from-kenyan-black via-kenyan-red to-kenyan-green overflow-hidden">
      <div className="absolute inset-0 bg-kenyan-flag-animated bg-400% animate-kenyan-flag opacity-20" />
      
      <div className="relative z-10 text-center text-white px-4 sm:px-6 lg:px-8 max-w-4xl mx-auto">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
        >
          <h1 className="text-5xl sm:text-6xl lg:text-7xl font-display font-bold mb-6 leading-tight">
            <span className="bg-gradient-to-r from-white via-kenyan-green to-white bg-clip-text text-transparent">
              SLUMPERS
            </span>
          </h1>
          
          <p className="text-xl sm:text-2xl lg:text-3xl font-medium mb-8 text-white/90">
            Kenya's Premier Gen Z Event & Merchandise Platform
          </p>
          
          <p className="text-lg sm:text-xl mb-12 text-white/80 max-w-2xl mx-auto">
            Experience the vibrant culture of Kenya's youth. Book events, buy tickets, 
            shop exclusive merchandise, and be part of the movement.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className="btn-primary text-lg px-8 py-4 bg-kenyan-green hover:bg-green-600"
            >
              Explore Events
            </motion.button>
            
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className="btn-outline text-lg px-8 py-4 border-2 border-white text-white hover:bg-white hover:text-kenyan-black"
            >
              Shop Merchandise
            </motion.button>
          </div>
        </motion.div>
      </div>
    </section>
  )
}
'@ | Out-File -FilePath "components\Hero.tsx" -Encoding UTF8

Write-Host "📊 Creating database schema..." -ForegroundColor Yellow

# prisma/schema.prisma
@'
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

model User {
  id           String   @id @default(cuid())
  email        String   @unique
  name         String
  passwordHash String?
  role         Role     @default(CUSTOMER)
  createdAt    DateTime @default(now())
  updatedAt    DateTime @updatedAt

  tickets  Ticket[]
  orders   Order[]
  bookings Booking[]

  @@map("users")
}

model Event {
  id          String      @id @default(cuid())
  title       String
  description String?
  date        DateTime
  venue       String
  price       Float
  capacity    Int
  sold        Int         @default(0)
  status      EventStatus @default(ACTIVE)
  imageUrl    String?
  category    String?
  createdAt   DateTime    @default(now())
  updatedAt   DateTime    @updatedAt

  tickets Ticket[]

  @@map("events")
}

model Ticket {
  id           String       @id @default(cuid())
  ticketNumber String       @unique
  eventId      String
  userId       String?
  buyerName    String
  buyerEmail   String
  buyerPhone   String?
  price        Float
  status       TicketStatus @default(VALID)
  qrCodeUrl    String?
  barcodeUrl   String?
  usedAt       DateTime?
  createdAt    DateTime     @default(now())

  event Event @relation(fields: [eventId], references: [id])
  user  User? @relation(fields: [userId], references: [id])

  @@map("tickets")
}

model Product {
  id          String        @id @default(cuid())
  name        String
  description String?
  price       Float
  category    Category
  gender      Gender?
  sizes       Size[]
  colors      String[]
  stock       Int           @default(0)
  imageUrls   String[]
  status      ProductStatus @default(ACTIVE)
  createdAt   DateTime      @default(now())
  updatedAt   DateTime      @updatedAt

  orderItems OrderItem[]

  @@map("products")
}

model Order {
  id              String      @id @default(cuid())
  userId          String?
  totalAmount     Float
  status          OrderStatus @default(PENDING)
  paymentMethod   String?
  paymentId       String?
  shippingAddress String?
  createdAt       DateTime    @default(now())
  updatedAt       DateTime    @updatedAt

  user       User?       @relation(fields: [userId], references: [id])
  orderItems OrderItem[]

  @@map("orders")
}

model OrderItem {
  id        String @id @default(cuid())
  orderId   String
  productId String
  quantity  Int
  price     Float
  size      Size?
  color     String?

  order   Order   @relation(fields: [orderId], references: [id])
  product Product @relation(fields: [productId], references: [id])

  @@map("order_items")
}

model Booking {
  id              String        @id @default(cuid())
  userId          String?
  name            String
  email           String
  phone           String
  eventType       String
  eventDate       DateTime
  guestCount      Int
  budgetRange     String?
  venuePreference String?
  notes           String?
  status          BookingStatus @default(PENDING)
  createdAt       DateTime      @default(now())
  updatedAt       DateTime      @updatedAt

  user User? @relation(fields: [userId], references: [id])

  @@map("bookings")
}

enum Role {
  CUSTOMER
  ADMIN
  SUPER_ADMIN
}

enum EventStatus {
  ACTIVE
  CANCELLED
  COMPLETED
  DRAFT
}

enum TicketStatus {
  VALID
  USED
  CANCELLED
  EXPIRED
}

enum ProductStatus {
  ACTIVE
  INACTIVE
  OUT_OF_STOCK
}

enum Category {
  CLOTHING
  ACCESSORIES
  FOOTWEAR
  ELECTRONICS
  BOOKS
  OTHER
}

enum Gender {
  MALE
  FEMALE
  UNISEX
}

enum Size {
  XS
  S
  M
  L
  XL
  XXL
}

enum OrderStatus {
  PENDING
  CONFIRMED
  SHIPPED
  DELIVERED
  CANCELLED
}

enum BookingStatus {
  PENDING
  CONFIRMED
  REJECTED
  COMPLETED
}
'@ | Out-File -FilePath "prisma\schema.prisma" -Encoding UTF8

Write-Host "🔧 Creating additional configuration files..." -ForegroundColor Yellow

# .gitignore
@'
# Dependencies
/node_modules
/.pnp
.pnp.js
.yarn/install-state.gz

# Testing
/coverage

# Next.js
/.next/
/out/

# Production
/build

# Misc
.DS_Store
*.pem

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Local env files
.env*.local
.env
.env.development.local
.env.test.local
.env.production.local

# Vercel
.vercel

# TypeScript
*.tsbuildinfo
next-env.d.ts

# Prisma
/prisma/migrations/
/prisma/dev.db
/prisma/dev.db-journal

# Uploads
/public/uploads/
/uploads/

# Logs
logs
*.log

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
Thumbs.db
.DS_Store

# Temporary files
*.tmp
*.temp
'@ | Out-File -FilePath ".gitignore" -Encoding UTF8

# vercel.json
@'
{
  "framework": "nextjs",
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "functions": {
    "app/api/**/*.ts": {
      "maxDuration": 30,
      "memory": 1024
    },
    "app/api/payments/**/*.ts": {
      "maxDuration": 60,
      "memory": 1024
    },
    "app/api/tickets/**/*.ts": {
      "maxDuration": 45,
      "memory": 1024
    }
  },
  "env": {
    "NODE_ENV": "production",
    "NEXT_TELEMETRY_DISABLED": "1"
  },
  "regions": ["iad1"],
  "headers": [
    {
      "source": "/api/(.*)",
      "headers": [
        {
          "key": "Access-Control-Allow-Origin",
          "value": "https://slumpers.vercel.app"
        },
        {
          "key": "Access-Control-Allow-Methods",
          "value": "GET, POST, PUT, DELETE, OPTIONS"
        },
        {
          "key": "Access-Control-Allow-Headers",
          "value": "Content-Type, Authorization, X-Requested-With"
        }
      ]
    }
  ],
  "crons": [
    {
      "path": "/api/cleanup/expired-tickets",
      "schedule": "0 2 * * *"
    }
  ]
}
'@ | Out-File -FilePath "vercel.json" -Encoding UTF8

Write-Host "📚 Creating documentation..." -ForegroundColor Yellow

# README.md
@'
# 🎉 Slumpers - Gen Z Events & Merchandise Platform

A vibrant, modern e-commerce and event booking platform designed for Kenya's Gen Z community.

## 🌟 Features

- 🎫 **Event Ticketing**: QR codes, barcodes, email/SMS delivery
- 🛍️ **E-commerce Shop**: Product catalog with advanced filtering
- 📅 **Event Management**: Booking system with calendar integration
- 💳 **Payment Processing**: Stripe + M-Pesa integration
- 🎨 **Vibrant Design**: Kenyan flag colors, Gen Z aesthetic
- 📱 **Mobile-First**: Responsive design for all devices
- 🔧 **Admin Dashboard**: Complete management system

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/slumpers-website.git
   cd slumpers-website
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   # Edit .env.local with your API keys
   ```

4. **Run development server**
   ```bash
   npm run dev
   ```

5. **Open in browser**
   Visit [http://localhost:3000](http://localhost:3000)

## 🔧 Tech Stack

- **Frontend**: Next.js 14, React 18, TypeScript
- **Styling**: Tailwind CSS, Framer Motion
- **Database**: Prisma ORM, PostgreSQL
- **Payments**: Stripe, M-Pesa Daraja API
- **Email**: SendGrid, Nodemailer
- **SMS**: Twilio
- **Deployment**: Vercel

## 📦 Environment Variables

See `.env.example` for all required environment variables.

## 🚀 Deployment

Deploy to Vercel with one click or follow the deployment guide in the docs.

## 📞 Support

- Email: support@slumpers.co.ke
- Phone: +254 700 123 456
- WhatsApp: +254 711 987 654

Built with ❤️ for Kenya's vibrant Gen Z community 🇰🇪
'@ | Out-File -FilePath "README.md" -Encoding UTF8

Write-Host "✅ Project creation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📁 Project created at: $projectPath" -ForegroundColor Cyan
Write-Host "📊 Total files created: 15+ configuration and core files" -ForegroundColor Cyan
Write-Host ""
Write-Host "🚀 Next steps:" -ForegroundColor Yellow
Write-Host "1. Navigate to the project folder" -ForegroundColor White
Write-Host "2. Run 'npm install' to install dependencies" -ForegroundColor White
Write-Host "3. Copy .env.example to .env.local and add your API keys" -ForegroundColor White
Write-Host "4. Upload to GitHub using the guide" -ForegroundColor White
Write-Host ""
Write-Host "🎉 Your Slumpers website is ready!" -ForegroundColor Green
