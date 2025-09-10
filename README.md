# Slumpers E-Commerce & Event Website

A vibrant, Gen Z-focused e-commerce and event booking platform for Slumpers, a Kenyan brand. Built with Next.js, featuring ticketing systems, merchandise shop, event bookings, and payment integrations.

## 🌟 Features

### 🎫 Ticketing System
- QR code and barcode generation for tickets
- Email and SMS ticket delivery
- Ticket verification and validation
- Admin panel for ticket management

### 🛍️ Merchandise Shop
- Product catalog with filters (category, size, gender, price)
- Shopping cart functionality
- Product search and sorting
- Wishlist management

### 📅 Event Management
- Event listings with search and filters
- Ticket purchasing with quantity selection
- Event calendar integration
- Admin event management

### 📋 Booking System
- Custom event booking requests
- Calendar availability display
- Booking form with validation
- Admin booking management

### 💳 Payment Integration
- Stripe payment processing
- M-Pesa (Safaricom Daraja API) integration
- Multiple payment methods support
- Secure payment handling

### 🎨 Design & UX
- Vibrant Gen Z Kenyan theme
- Responsive mobile-first design
- Dark/light mode toggle
- Smooth animations with Framer Motion
- Kenyan flag color palette

## 🚀 Tech Stack

- **Frontend**: Next.js 14, React 18, TypeScript
- **Styling**: Tailwind CSS, Framer Motion
- **Database**: Prisma ORM with PostgreSQL
- **Payments**: Stripe, M-Pesa Daraja API
- **Authentication**: NextAuth.js
- **Email**: Nodemailer
- **SMS**: Twilio
- **QR/Barcode**: qrcode, bwip-js
- **PDF Generation**: jsPDF

## 📦 Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd slumpers-website
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   ```
   
   Fill in your environment variables:
   ```env
   # Database
   DATABASE_URL="postgresql://username:password@localhost:5432/slumpers_db"
   
   # NextAuth
   NEXTAUTH_URL="http://localhost:3000"
   NEXTAUTH_SECRET="your-secret-key"
   
   # Stripe
   NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_test_..."
   STRIPE_SECRET_KEY="sk_test_..."
   
   # M-Pesa (Safaricom Daraja API)
   MPESA_CONSUMER_KEY="your-consumer-key"
   MPESA_CONSUMER_SECRET="your-consumer-secret"
   MPESA_SHORTCODE="174379"
   MPESA_PASSKEY="your-passkey"
   MPESA_CALLBACK_URL="https://yourdomain.com/api/payments/mpesa/callback"
   
   # Email (Gmail/SMTP)
   EMAIL_HOST="smtp.gmail.com"
   EMAIL_PORT="587"
   EMAIL_USER="your-email@gmail.com"
   EMAIL_PASS="your-app-password"
   
   # SMS (Twilio)
   TWILIO_ACCOUNT_SID="your-account-sid"
   TWILIO_AUTH_TOKEN="your-auth-token"
   TWILIO_PHONE_NUMBER="+1234567890"
   ```

4. **Set up the database**
   ```bash
   npx prisma generate
   npx prisma db push
   ```

5. **Run the development server**
   ```bash
   npm run dev
   ```

   Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🏗️ Project Structure

```
slumpers-website/
├── app/                    # Next.js 14 app directory
│   ├── admin/             # Admin dashboard
│   ├── api/               # API routes
│   ├── bookings/          # Booking pages
│   ├── events/            # Event pages
│   ├── shop/              # Shop pages
│   ├── globals.css        # Global styles
│   ├── layout.tsx         # Root layout
│   └── page.tsx           # Homepage
├── components/            # React components
│   ├── admin/             # Admin components
│   ├── ui/                # UI components
│   └── ...                # Feature components
├── lib/                   # Utility libraries
│   ├── email.ts           # Email utilities
│   ├── mpesa.ts           # M-Pesa integration
│   ├── sms.ts             # SMS utilities
│   ├── stripe.ts          # Stripe integration
│   └── ticket-generator.ts # Ticket generation
├── prisma/                # Database schema
│   └── schema.prisma      # Prisma schema
├── public/                # Static assets
└── ...                    # Config files
```

## 🔧 Configuration

### M-Pesa Setup
1. Register for Safaricom Daraja API
2. Get your Consumer Key and Consumer Secret
3. Set up your shortcode and passkey
4. Configure callback URLs

### Stripe Setup
1. Create a Stripe account
2. Get your publishable and secret keys
3. Set up webhooks for payment confirmation

### Email Setup
1. Use Gmail with App Password or SMTP service
2. Configure email templates in `lib/email.ts`

### SMS Setup
1. Create a Twilio account
2. Get your Account SID and Auth Token
3. Purchase a phone number for SMS

## 🚀 Deployment

### Vercel (Recommended)
1. Connect your GitHub repository to Vercel
2. Set environment variables in Vercel dashboard
3. Deploy automatically on push to main branch

### Manual Deployment
1. Build the application:
   ```bash
   npm run build
   ```
2. Start the production server:
   ```bash
   npm start
   ```

## 📱 Features Overview

### For Customers
- Browse and purchase event tickets
- Shop for merchandise with filters
- Book custom events
- Receive tickets via email/SMS
- Dark/light mode preference

### For Admins
- Verify tickets with QR/barcode scanner
- Manage events and bookings
- View sales analytics
- Handle customer requests

## 🎨 Brand Identity

The website reflects Slumpers' vibrant Gen Z Kenyan identity with:
- Kenyan flag colors (black, red, green, white)
- Bold, modern typography
- Smooth animations and transitions
- Mobile-first responsive design
- Cultural elements and local language touches

## 🔒 Security

- Secure payment processing with Stripe and M-Pesa
- Environment variable protection
- Input validation and sanitization
- CSRF protection
- Rate limiting on API endpoints

## 📞 Support

For technical support or questions:
- Email: tech@slumpers.co.ke
- Phone: +254 700 123 456
- WhatsApp: +254 711 987 654

## 📄 License

This project is proprietary software owned by Slumpers Kenya.

---

Built with ❤️ for the vibrant Gen Z community in Kenya 🇰🇪
