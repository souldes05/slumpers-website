# 🚀 Step-by-Step Deployment Guide for Slumpers Website

## 📋 What You Need Before Starting

### Required Accounts & Services
1. **GitHub Account** (free) - [github.com](https://github.com)
2. **Vercel Account** (free) - [vercel.com](https://vercel.com)
3. **Stripe Account** (free) - [stripe.com](https://stripe.com)
4. **SendGrid Account** (free) - [sendgrid.com](https://sendgrid.com)
5. **Twilio Account** (paid) - [twilio.com](https://twilio.com)
6. **M-Pesa Developer Account** (free) - [developer.safaricom.co.ke](https://developer.safaricom.co.ke)

### Required Software
- **Node.js** (v18+) - [nodejs.org](https://nodejs.org)
- **Git** - [git-scm.com](https://git-scm.com)

---

## 🔧 STEP 1: Install Required Software

### Install Node.js
1. Go to [nodejs.org](https://nodejs.org)
2. Download LTS version (18.x or higher)
3. Run installer with default settings
4. Verify installation:
   ```bash
   node --version
   npm --version
   ```

### Install Git
1. Go to [git-scm.com](https://git-scm.com)
2. Download for Windows
3. Install with default settings
4. Verify: `git --version`

---

## 🔑 STEP 2: Get All API Keys

### A. Stripe Setup (Payment Processing)
1. Go to [stripe.com](https://stripe.com) → Create account
2. Complete business verification
3. Go to **Developers** → **API Keys**
4. Copy these keys:
   ```
   NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_test_..."
   STRIPE_SECRET_KEY="sk_test_..."
   ```
5. Go to **Developers** → **Webhooks** → **Add endpoint**
6. URL: `https://your-domain.vercel.app/api/payments/stripe/webhook`
7. Events: `payment_intent.succeeded`, `payment_intent.payment_failed`
8. Copy webhook secret:
   ```
   STRIPE_WEBHOOK_SECRET="whsec_..."
   ```

### B. SendGrid Setup (Email Service)
1. Go to [sendgrid.com](https://sendgrid.com) → Create account
2. Complete sender verification
3. Go to **Settings** → **API Keys** → **Create API Key**
4. Choose "Full Access" → Create
5. Copy the key:
   ```
   SENDGRID_API_KEY="SG.your-api-key-here"
   ```

### C. Twilio Setup (SMS Service)
1. Go to [twilio.com](https://twilio.com) → Create account
2. Add $20+ credit to account
3. Go to **Console** → Copy these:
   ```
   TWILIO_ACCOUNT_SID="ACxxxxx..."
   TWILIO_AUTH_TOKEN="your-auth-token"
   ```
4. Go to **Phone Numbers** → **Buy a number**
5. Choose a number with SMS capability:
   ```
   TWILIO_PHONE_NUMBER="+1234567890"
   ```

### D. M-Pesa Setup (Mobile Money)
1. Go to [developer.safaricom.co.ke](https://developer.safaricom.co.ke)
2. Create account → Create new app
3. Choose "Lipa Na M-Pesa Online"
4. Get sandbox credentials (already in your .env.example):
   ```
   MPESA_CONSUMER_KEY="6lPrzrWUSs6cQfqDfQOuEgz2gA3QeorwdlAQn8nSsCzLm4Lb"
   MPESA_CONSUMER_SECRET="nEfuybWEyVHlYPQauYOJIiNmd5m8sC3sCXCuf9eQBeeUAG2b3AwP9Je3Ca7TAsbw"
   MPESA_SHORTCODE="174379"
   MPESA_PASSKEY="bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"
   ```

---

## 📁 STEP 3: Prepare Your Code

### Navigate to Project
```bash
cd C:\Users\user\CascadeProjects\slumpers-website
```

### Install Dependencies
```bash
npm install
```

### Create Environment File
```bash
# Copy the template
copy .env.example .env.local

# Edit with your API keys
notepad .env.local
```

### Fill in .env.local with your keys:
```env
# Database (we'll set this up in Vercel)
DATABASE_URL="postgresql://temp:temp@localhost:5432/temp"

# Vercel URLs (will be auto-set)
VERCEL_URL="https://slumpers.vercel.app"
NEXT_PUBLIC_VERCEL_URL="https://slumpers.vercel.app"

# Stripe (use your keys from Step 2A)
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_test_your_key_here"
STRIPE_SECRET_KEY="sk_test_your_key_here"
STRIPE_WEBHOOK_SECRET="whsec_your_webhook_secret"

# M-Pesa (sandbox - already correct)
MPESA_CONSUMER_KEY="6lPrzrWUSs6cQfqDfQOuEgz2gA3QeorwdlAQn8nSsCzLm4Lb"
MPESA_CONSUMER_SECRET="nEfuybWEyVHlYPQauYOJIiNmd5m8sC3sCXCuf9eQBeeUAG2b3AwP9Je3Ca7TAsbw"
MPESA_ENVIRONMENT="sandbox"
MPESA_SHORTCODE="174379"
MPESA_PASSKEY="bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"
MPESA_CALLBACK_URL="https://slumpers.vercel.app/api/payments/mpesa/callback"

# NextAuth
NEXTAUTH_SECRET="your-super-secret-key-minimum-32-characters-long"
NEXTAUTH_URL="https://slumpers.vercel.app"

# SendGrid (use your key from Step 2B)
SENDGRID_API_KEY="SG.your-sendgrid-api-key-here"

# Twilio (use your keys from Step 2C)
TWILIO_ACCOUNT_SID="ACxxxxx..."
TWILIO_AUTH_TOKEN="your-auth-token"
TWILIO_PHONE_NUMBER="+1234567890"

# Security
CRON_SECRET="your-random-cron-secret-key"
```

---

## 📤 STEP 4: Push to GitHub

### Initialize Git Repository
```bash
git init
git add .
git commit -m "Initial Slumpers website commit"
```

### Create GitHub Repository
1. Go to [github.com](https://github.com) → **New Repository**
2. Name: `slumpers-website`
3. Make it **Private** (recommended)
4. Don't initialize with README (we already have files)
5. Click **Create Repository**

### Push Your Code
```bash
# Replace 'yourusername' with your GitHub username
git remote add origin https://github.com/yourusername/slumpers-website.git
git branch -M main
git push -u origin main
```

---

## 🚀 STEP 5: Deploy to Vercel

### Create Vercel Account
1. Go to [vercel.com](https://vercel.com)
2. Sign up with GitHub account
3. Authorize Vercel to access your repositories

### Import Project
1. Click **"New Project"**
2. Find your `slumpers-website` repository
3. Click **"Import"**
4. **Framework Preset**: Next.js (auto-detected)
5. **Root Directory**: `./` (default)
6. Click **"Deploy"**

### Set Up Database
1. In Vercel dashboard → Go to **Storage** tab
2. Click **"Create Database"** → **"Postgres"**
3. Name: `slumpers-db`
4. Region: Choose closest to your users
5. Click **"Create"**
6. Copy the connection string

### Configure Environment Variables
1. Go to **Settings** → **Environment Variables**
2. Add each variable from your `.env.local`:

**Required Variables:**
```
DATABASE_URL = [paste your Vercel Postgres connection string]
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY = pk_test_your_key
STRIPE_SECRET_KEY = sk_test_your_key
STRIPE_WEBHOOK_SECRET = whsec_your_webhook_secret
SENDGRID_API_KEY = SG.your_sendgrid_key
TWILIO_ACCOUNT_SID = ACxxxxx...
TWILIO_AUTH_TOKEN = your_twilio_token
TWILIO_PHONE_NUMBER = +1234567890
NEXTAUTH_SECRET = your-32-character-secret
MPESA_CONSUMER_KEY = 6lPrzrWUSs6cQfqDfQOuEgz2gA3QeorwdlAQn8nSsCzLm4Lb
MPESA_CONSUMER_SECRET = nEfuybWEyVHlYPQauYOJIiNmd5m8sC3sCXCuf9eQBeeUAG2b3AwP9Je3Ca7TAsbw
MPESA_ENVIRONMENT = sandbox
MPESA_SHORTCODE = 174379
MPESA_PASSKEY = bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919
CRON_SECRET = your-random-secret
```

3. Set **Environment**: Production
4. Click **"Save"**

### Redeploy with Environment Variables
1. Go to **Deployments** tab
2. Click **"Redeploy"** on latest deployment
3. Check **"Use existing Build Cache"**
4. Click **"Redeploy"**

---

## 🗄️ STEP 6: Initialize Database

### Option A: Using Vercel CLI
```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Pull environment variables
vercel env pull .env.local

# Initialize database
npx prisma generate
npx prisma db push
```

### Option B: Manual Database Setup
1. Go to your Vercel Postgres dashboard
2. Click **"Query"** tab
3. Run this SQL to create tables:

```sql
-- Users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255),
  role VARCHAR(50) DEFAULT 'customer',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Events table
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  date TIMESTAMP NOT NULL,
  venue VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  capacity INTEGER NOT NULL,
  sold INTEGER DEFAULT 0,
  status VARCHAR(50) DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tickets table
CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  ticket_number VARCHAR(100) UNIQUE NOT NULL,
  event_id INTEGER REFERENCES events(id),
  buyer_name VARCHAR(255) NOT NULL,
  buyer_email VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  status VARCHAR(50) DEFAULT 'valid',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(100),
  stock INTEGER DEFAULT 0,
  status VARCHAR(50) DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bookings table
CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  event_type VARCHAR(100) NOT NULL,
  event_date DATE NOT NULL,
  guest_count INTEGER NOT NULL,
  status VARCHAR(50) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 🔧 STEP 7: Configure Custom Domain (Optional)

### If you have a domain (e.g., slumpers.co.ke):
1. Go to Vercel project → **Settings** → **Domains**
2. Add your domain: `slumpers.co.ke`
3. Add www subdomain: `www.slumpers.co.ke`
4. Configure DNS records as shown by Vercel
5. Wait for SSL certificate (automatic)

---

## ✅ STEP 8: Test Your Deployment

### Test These Features:
1. **Homepage**: Visit your Vercel URL
2. **Shop**: Browse products and add to cart
3. **Events**: View events and try ticket purchase
4. **Payments**: Test with Stripe test cards
5. **Admin Panel**: Visit `/admin` for management
6. **Email**: Test ticket delivery
7. **SMS**: Test with your phone number

### Stripe Test Cards:
- **Success**: `4242 4242 4242 4242`
- **Decline**: `4000 0000 0000 0002`
- **3D Secure**: `4000 0025 0000 3155`

---

## 🚨 Troubleshooting

### Build Errors
```bash
# Check build logs in Vercel dashboard
# Common fixes:
npm install  # Install missing dependencies
npm run build  # Test build locally
```

### Database Connection Issues
- Verify DATABASE_URL is correct
- Check if database exists in Vercel Storage
- Ensure tables are created

### Payment Issues
- Verify Stripe keys are correct
- Check webhook endpoint is accessible
- Test with Stripe test cards first

### Email Not Working
- Verify SendGrid API key
- Check sender verification status
- Test with a simple email first

---

## 🎯 Final Checklist

- [ ] All API keys configured in Vercel
- [ ] Database tables created
- [ ] Website loads at Vercel URL
- [ ] Payments work with test cards
- [ ] Emails are being sent
- [ ] SMS notifications work
- [ ] Admin panel accessible
- [ ] M-Pesa sandbox tested

---

## 🎉 You're Live!

Your Slumpers website is now deployed and ready for business!

**Your URLs:**
- **Website**: `https://your-project.vercel.app`
- **Admin**: `https://your-project.vercel.app/admin`

**Next Steps:**
1. Test all features thoroughly
2. Switch to production API keys when ready
3. Add your custom domain
4. Start selling tickets and merchandise!

**Support:**
- Vercel docs: [vercel.com/docs](https://vercel.com/docs)
- Next.js docs: [nextjs.org/docs](https://nextjs.org/docs)
- Stripe docs: [stripe.com/docs](https://stripe.com/docs)
