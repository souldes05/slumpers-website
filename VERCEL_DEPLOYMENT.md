# 🚀 Vercel Deployment Guide for Slumpers Website

## 📋 Overview

The Slumpers website is now fully optimized for Vercel deployment with:
- Vercel Postgres database integration
- Vercel Blob storage for file uploads
- SendGrid email service (Vercel-optimized)
- Automatic cron jobs for cleanup
- Edge functions for optimal performance

## 🔧 Pre-Deployment Setup

### 1. Vercel Account Setup
1. Create account at [vercel.com](https://vercel.com)
2. Install Vercel CLI: `npm i -g vercel`
3. Login: `vercel login`

### 2. Database Setup (Choose One)

#### Option A: Vercel Postgres (Recommended)
```bash
# In Vercel dashboard:
# 1. Go to Storage tab
# 2. Create Postgres database
# 3. Copy connection string
```

#### Option B: Neon Database (Free Alternative)
```bash
# 1. Go to neon.tech
# 2. Create free database
# 3. Copy connection string
```

### 3. Required Environment Variables

Set these in Vercel Dashboard (Settings > Environment Variables):

```env
# Database
DATABASE_URL="postgres://default:password@hostname-pooler.region.postgres.vercel-storage.com:5432/verceldb"

# Vercel URLs (auto-populated)
VERCEL_URL="https://slumpers.vercel.app"
NEXT_PUBLIC_VERCEL_URL="https://slumpers.vercel.app"

# Stripe
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_live_..."
STRIPE_SECRET_KEY="sk_live_..."
STRIPE_WEBHOOK_SECRET="whsec_..."

# M-Pesa
MPESA_CONSUMER_KEY="your-production-key"
MPESA_CONSUMER_SECRET="your-production-secret"
MPESA_ENVIRONMENT="production"
MPESA_SHORTCODE="your-shortcode"
MPESA_PASSKEY="your-production-passkey"
MPESA_CALLBACK_URL="https://slumpers.vercel.app/api/payments/mpesa/callback"

# NextAuth
NEXTAUTH_SECRET="your-super-secret-32-character-key"
NEXTAUTH_URL="https://slumpers.vercel.app"

# Email (SendGrid recommended for Vercel)
SENDGRID_API_KEY="SG.your-sendgrid-api-key"

# SMS
TWILIO_ACCOUNT_SID="your-twilio-sid"
TWILIO_AUTH_TOKEN="your-twilio-token"
TWILIO_PHONE_NUMBER="+1234567890"

# File Storage
BLOB_READ_WRITE_TOKEN="vercel_blob_rw_token"

# Cron Security
CRON_SECRET="your-cron-secret-key"

# Analytics (Optional)
NEXT_PUBLIC_GOOGLE_ANALYTICS="G-XXXXXXXXXX"
```

## 🚀 Deployment Steps

### Method 1: GitHub Integration (Recommended)

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial Slumpers website"
   git branch -M main
   git remote add origin https://github.com/yourusername/slumpers-website.git
   git push -u origin main
   ```

2. **Connect to Vercel**
   - Go to Vercel dashboard
   - Click "New Project"
   - Import from GitHub
   - Select your repository
   - Configure environment variables
   - Deploy!

### Method 2: Vercel CLI

```bash
# In project directory
vercel

# Follow prompts:
# - Link to existing project? No
# - Project name: slumpers-website
# - Directory: ./
# - Override settings? No

# Deploy to production
vercel --prod
```

## 🗄️ Database Migration

After deployment, initialize your database:

```bash
# Using Vercel CLI
vercel env pull .env.local
npx prisma generate
npx prisma db push

# Or use the API endpoint
curl https://slumpers.vercel.app/api/admin/init-db
```

## 🔧 Vercel-Specific Features

### 1. Edge Functions
- Payment processing optimized for edge
- Ticket generation with reduced latency
- Global CDN for static assets

### 2. Cron Jobs
- Automatic cleanup of expired tickets (daily at 2 AM)
- Database maintenance tasks
- Analytics data processing

### 3. Blob Storage
- Ticket PDFs stored in Vercel Blob
- Product images optimized delivery
- Automatic CDN distribution

### 4. Analytics
- Built-in Vercel Analytics
- Real-time performance monitoring
- User behavior tracking

## 📧 Email Configuration

### SendGrid Setup (Recommended for Vercel)
1. Create SendGrid account
2. Verify sender identity
3. Generate API key
4. Add to environment variables

### Alternative: Gmail SMTP
```env
EMAIL_HOST="smtp.gmail.com"
EMAIL_PORT="587"
EMAIL_USER="your-email@gmail.com"
EMAIL_PASS="your-app-password"
```

## 🔒 Security Configuration

### 1. Domain Security
```bash
# In vercel.json - already configured:
# - CORS headers
# - Security headers
# - Frame protection
```

### 2. API Rate Limiting
- Built into Vercel Edge Functions
- Automatic DDoS protection
- Request throttling

### 3. Environment Security
- All secrets encrypted
- Automatic HTTPS
- Edge security policies

## 📊 Monitoring & Analytics

### 1. Vercel Analytics
- Automatic page view tracking
- Performance metrics
- User engagement data

### 2. Error Monitoring
```bash
# Optional: Add Sentry
npm install @sentry/nextjs
```

### 3. Uptime Monitoring
- Vercel provides 99.99% uptime
- Automatic failover
- Global edge network

## 🧪 Testing Production

### 1. Payment Testing
- Use Stripe test mode initially
- Test M-Pesa sandbox
- Verify webhook endpoints

### 2. Email Testing
- Test ticket delivery
- Verify booking confirmations
- Check spam folder placement

### 3. Performance Testing
- Lighthouse scores
- Mobile responsiveness
- Load testing

## 🔄 Continuous Deployment

### Automatic Deployments
- Push to `main` branch = production deploy
- Push to other branches = preview deploy
- Pull request previews enabled

### Environment Branches
```bash
# Production: main branch
# Staging: staging branch  
# Development: dev branch
```

## 📱 Custom Domain Setup

1. **Purchase Domain** (e.g., slumpers.co.ke)
2. **Add to Vercel**
   - Go to Project Settings > Domains
   - Add your domain
   - Configure DNS records
3. **SSL Certificate**
   - Automatic Let's Encrypt SSL
   - HTTPS redirect enabled

## 🚨 Troubleshooting

### Common Issues

**Build Failures**
```bash
# Check build logs in Vercel dashboard
# Verify all dependencies in package.json
# Check TypeScript errors
```

**Database Connection**
```bash
# Verify DATABASE_URL format
# Check IP allowlisting
# Test connection locally
```

**Environment Variables**
```bash
# Ensure all required vars are set
# Check for typos in variable names
# Verify production vs development values
```

## 📈 Performance Optimization

### 1. Image Optimization
- Next.js Image component used throughout
- Automatic WebP conversion
- Responsive image loading

### 2. Code Splitting
- Automatic route-based splitting
- Dynamic imports for heavy components
- Tree shaking enabled

### 3. Caching Strategy
- Static assets cached at edge
- API responses cached appropriately
- Database query optimization

## 🎯 Go-Live Checklist

- [ ] All environment variables configured
- [ ] Database initialized and migrated
- [ ] Payment systems tested (Stripe + M-Pesa)
- [ ] Email delivery working
- [ ] SMS notifications working
- [ ] Admin panel accessible
- [ ] Custom domain configured
- [ ] SSL certificate active
- [ ] Analytics tracking enabled
- [ ] Error monitoring setup
- [ ] Backup strategy in place

## 🎉 Post-Deployment

Your Slumpers website will be live at:
- **Production**: https://slumpers.vercel.app (or your custom domain)
- **Admin Panel**: https://slumpers.vercel.app/admin
- **API Endpoints**: https://slumpers.vercel.app/api/*

The website is now ready to serve Kenya's vibrant Gen Z community with:
- Lightning-fast global performance
- Automatic scaling
- 99.99% uptime
- Professional email delivery
- Secure payment processing
- Real-time analytics

Welcome to the future of event ticketing and e-commerce in Kenya! 🇰🇪✨
