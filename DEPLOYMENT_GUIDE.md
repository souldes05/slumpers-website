# 🚀 Slumpers Website Deployment Guide

## Prerequisites

### 1. Install Node.js
Download and install Node.js (v18 or later) from [nodejs.org](https://nodejs.org/)

### 2. Install Git
Download Git from [git-scm.com](https://git-scm.com/) if not already installed

## 🏃‍♂️ Quick Start

### 1. Install Dependencies
```bash
cd slumpers-website
npm install
```

### 2. Environment Setup
```bash
# Copy environment template
cp .env.example .env.local

# Edit .env.local with your credentials
notepad .env.local  # Windows
# or
nano .env.local     # Linux/Mac
```

### 3. Database Setup
```bash
# Generate Prisma client
npx prisma generate

# Push database schema
npx prisma db push

# (Optional) Seed database
npx prisma db seed
```

### 4. Start Development Server
```bash
npm run dev
```

Visit `http://localhost:3000` to see your website!

## 🔧 Environment Variables Setup

### Required Variables (.env.local)

```env
# Database
DATABASE_URL="postgresql://username:password@localhost:5432/slumpers_db"

# NextAuth
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-super-secret-key-here"

# Stripe Payment
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_test_..."
STRIPE_SECRET_KEY="sk_test_..."

# M-Pesa (Safaricom Daraja API)
MPESA_CONSUMER_KEY="your-consumer-key"
MPESA_CONSUMER_SECRET="your-consumer-secret"
MPESA_SHORTCODE="174379"
MPESA_PASSKEY="your-passkey"
MPESA_CALLBACK_URL="https://yourdomain.com/api/payments/mpesa/callback"

# Email (Gmail)
EMAIL_HOST="smtp.gmail.com"
EMAIL_PORT="587"
EMAIL_USER="your-email@gmail.com"
EMAIL_PASS="your-gmail-app-password"

# SMS (Twilio)
TWILIO_ACCOUNT_SID="your-twilio-sid"
TWILIO_AUTH_TOKEN="your-twilio-token"
TWILIO_PHONE_NUMBER="+1234567890"
```

## 🔑 Getting API Keys

### Stripe Setup
1. Go to [stripe.com](https://stripe.com) and create an account
2. Navigate to Developers > API Keys
3. Copy your Publishable Key and Secret Key
4. For production, use live keys instead of test keys

### M-Pesa Setup (Safaricom Daraja API)
1. Go to [developer.safaricom.co.ke](https://developer.safaricom.co.ke)
2. Create an account and new app
3. Get Consumer Key and Consumer Secret
4. Apply for production credentials
5. Set up your callback URL

### Gmail Setup
1. Enable 2-factor authentication on your Gmail account
2. Generate an App Password:
   - Go to Google Account settings
   - Security > 2-Step Verification > App passwords
   - Generate password for "Mail"
3. Use this app password in EMAIL_PASS

### Twilio Setup
1. Create account at [twilio.com](https://twilio.com)
2. Get Account SID and Auth Token from console
3. Purchase a phone number for SMS

## 🗄️ Database Setup

### PostgreSQL (Recommended)
```bash
# Install PostgreSQL
# Windows: Download from postgresql.org
# Mac: brew install postgresql
# Ubuntu: sudo apt install postgresql

# Create database
createdb slumpers_db

# Update DATABASE_URL in .env.local
DATABASE_URL="postgresql://username:password@localhost:5432/slumpers_db"
```

### Alternative: SQLite (Development)
```env
DATABASE_URL="file:./dev.db"
```

## 🌐 Deployment Options

### Option 1: Vercel (Recommended)
1. Push code to GitHub repository
2. Go to [vercel.com](https://vercel.com) and import project
3. Set environment variables in Vercel dashboard
4. Deploy automatically

### Option 2: Netlify
1. Build the project: `npm run build`
2. Deploy the `out` folder to Netlify
3. Set environment variables in Netlify dashboard

### Option 3: Self-hosted
```bash
# Build for production
npm run build

# Start production server
npm start
```

## 🔒 Security Checklist

- [ ] Use strong NEXTAUTH_SECRET
- [ ] Set up HTTPS/SSL certificates
- [ ] Configure CORS properly
- [ ] Use production API keys
- [ ] Set up rate limiting
- [ ] Enable database backups
- [ ] Configure monitoring

## 🧪 Testing

### Run Tests
```bash
# Unit tests
npm test

# E2E tests
npm run test:e2e

# Lint code
npm run lint
```

### Test Payment Integration
1. Use Stripe test cards for testing
2. Use M-Pesa sandbox for testing
3. Test email delivery with real email
4. Test SMS with real phone number

## 📱 Features to Test

### Customer Flow
- [ ] Browse events and merchandise
- [ ] Add items to cart
- [ ] Purchase tickets with Stripe
- [ ] Purchase tickets with M-Pesa
- [ ] Receive tickets via email
- [ ] Receive tickets via SMS
- [ ] Submit booking requests

### Admin Flow
- [ ] Access admin dashboard at `/admin`
- [ ] Verify tickets with QR/barcode
- [ ] Manage events (create, edit, delete)
- [ ] Review booking requests
- [ ] View analytics

## 🚨 Troubleshooting

### Common Issues

**Database Connection Error**
```bash
# Check PostgreSQL is running
sudo service postgresql status

# Reset database
npx prisma db push --force-reset
```

**Payment Issues**
- Verify API keys are correct
- Check webhook endpoints
- Ensure HTTPS for production

**Email Not Sending**
- Verify Gmail app password
- Check firewall/antivirus blocking SMTP
- Test with different email provider

**SMS Not Sending**
- Verify Twilio credentials
- Check phone number format (+country code)
- Ensure account has credits

## 📞 Support

If you encounter issues:
1. Check the logs: `npm run dev` shows detailed errors
2. Verify environment variables are set correctly
3. Test API endpoints individually
4. Check database connection

## 🎯 Production Checklist

Before going live:
- [ ] Test all payment flows
- [ ] Verify email/SMS delivery
- [ ] Test ticket verification
- [ ] Set up monitoring
- [ ] Configure backups
- [ ] Update domain settings
- [ ] Test mobile responsiveness
- [ ] Performance optimization
- [ ] Security audit

## 📈 Performance Tips

1. **Image Optimization**: Use Next.js Image component
2. **Caching**: Enable Redis for session storage
3. **CDN**: Use Vercel/Cloudflare for static assets
4. **Database**: Add indexes for frequently queried fields
5. **Monitoring**: Set up error tracking (Sentry)

---

🎉 **Your Slumpers website is ready to launch!** 

The platform includes everything needed for a successful e-commerce and event booking business, with authentic Kenyan Gen Z branding and professional functionality.
