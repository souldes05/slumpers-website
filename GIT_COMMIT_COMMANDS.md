# 🚀 Step-by-Step Git Commands to Upload Slumpers Website to GitHub

## 📋 Prerequisites

1. **Install Git** (if not already installed)
   - Download from: https://git-scm.com/download/windows
   - Or check if installed: `git --version`

2. **GitHub Account**
   - Sign up at: https://github.com
   - Note your username

## 🔧 Step 1: Open Terminal in Your Project Folder

**Option A: PowerShell (Recommended)**
```powershell
# Navigate to your project directory
cd "C:\Users\user\CascadeProjects\slumpers-website"
```

**Option B: Command Prompt**
```cmd
cd C:\Users\user\CascadeProjects\slumpers-website
```

**Option C: Git Bash**
```bash
cd /c/Users/user/CascadeProjects/slumpers-website
```

## 🎯 Step 2: Initialize Git Repository

```bash
# Initialize a new Git repository
git init

# Check status (should show untracked files)
git status
```

**Expected Output:**
```
Initialized empty Git repository in C:/Users/user/CascadeProjects/slumpers-website/.git/
```

## 📝 Step 3: Configure Git (First Time Only)

```bash
# Set your name (replace with your actual name)
git config --global user.name "Your Name"

# Set your email (use your GitHub email)
git config --global user.email "your.email@gmail.com"

# Verify configuration
git config --list
```

## 📦 Step 4: Add All Files to Git

```bash
# Add all files to staging area
git add .

# Check what files are staged
git status
```

**Expected Output:**
```
Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   .env.example
        new file:   .gitignore
        new file:   README.md
        ... (all your files)
```

## 💾 Step 5: Create Your First Commit

```bash
# Commit all files with a descriptive message
git commit -m "Initial commit: Complete Slumpers e-commerce and event platform

- Full Next.js 14 application with TypeScript
- E-commerce shop with product catalog and cart
- Event ticketing system with QR codes
- Payment integration (Stripe + M-Pesa)
- Admin dashboard for management
- Vibrant Gen Z Kenyan design theme
- Complete API routes and database schema
- Production-ready Vercel deployment config"
```

**Expected Output:**
```
[main (root-commit) abc1234] Initial commit: Complete Slumpers e-commerce...
 XX files changed, XXXX insertions(+)
 create mode 100644 .env.example
 create mode 100644 .gitignore
 ... (list of all files)
```

## 🌐 Step 6: Create GitHub Repository

**Option A: Using GitHub CLI (if installed)**
```bash
# Install GitHub CLI first: https://cli.github.com/
gh repo create slumpers-website --private --description "Gen Z e-commerce and event platform for Kenya"
```

**Option B: Manual Creation (Recommended)**
1. Go to https://github.com
2. Click the **"+"** icon → **"New repository"**
3. **Repository name**: `slumpers-website`
4. **Description**: `Gen Z e-commerce and event platform for Kenya 🇰🇪`
5. Choose **Private** (recommended)
6. **DON'T** check "Initialize with README" (we already have files)
7. Click **"Create repository"**

## 🔗 Step 7: Connect Local Repository to GitHub

```bash
# Add GitHub repository as remote origin
# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/slumpers-website.git

# Verify remote was added
git remote -v
```

**Expected Output:**
```
origin  https://github.com/YOUR_USERNAME/slumpers-website.git (fetch)
origin  https://github.com/YOUR_USERNAME/slumpers-website.git (push)
```

## 🚀 Step 8: Push to GitHub

```bash
# Set main branch as default and push
git branch -M main
git push -u origin main
```

**You'll be prompted for GitHub credentials:**
- **Username**: Your GitHub username
- **Password**: Your GitHub Personal Access Token (not your account password)

**Expected Output:**
```
Enumerating objects: XX, done.
Counting objects: 100% (XX/XX), done.
Delta compression using up to X threads
Compressing objects: 100% (XX/XX), done.
Writing objects: 100% (XX/XX), XXX.XX KiB | XXX.XX MiB/s, done.
Total XX (delta X), reused 0 (delta 0), pack-reused 0
To https://github.com/YOUR_USERNAME/slumpers-website.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

## ✅ Step 9: Verify Upload Success

```bash
# Check repository status
git status

# View commit history
git log --oneline
```

Visit your GitHub repository: `https://github.com/YOUR_USERNAME/slumpers-website`

## 🔐 GitHub Authentication Setup

### Personal Access Token (Recommended)

1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. **Note**: "Slumpers Website Access"
4. **Expiration**: 90 days (or custom)
5. **Scopes**: Check `repo` (full repository access)
6. Click "Generate token"
7. **COPY THE TOKEN** (you won't see it again)
8. Use this token as your password when pushing

### SSH Key Setup (Alternative)

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@gmail.com"

# Add to SSH agent
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub
```

Then add the public key to GitHub → Settings → SSH and GPG keys

## 🔄 Future Updates

After making changes to your project:

```bash
# Check what changed
git status

# Add changed files
git add .

# Commit changes
git commit -m "Add new feature: describe what you changed"

# Push to GitHub
git push
```

## 🚨 Troubleshooting Common Issues

### "Repository already exists"
```bash
# If you need to change the repository name
git remote set-url origin https://github.com/YOUR_USERNAME/new-repo-name.git
```

### "Permission denied"
- Check your GitHub username and token
- Ensure repository exists and you have write access
- Try using Personal Access Token instead of password

### "Large files rejected"
```bash
# Remove large files from Git history
git rm --cached path/to/large/file
git commit -m "Remove large file"
```

### "Nothing to commit"
```bash
# If no changes detected, check:
git status
# Make sure files aren't in .gitignore that you want to include
```

### "Failed to push"
```bash
# If someone else made changes, pull first:
git pull origin main
# Then push:
git push
```

## 📊 Complete Command Sequence (Copy & Paste)

Here's the complete sequence for quick copy-paste:

```bash
# Navigate to project
cd "C:\Users\user\CascadeProjects\slumpers-website"

# Initialize Git
git init

# Configure Git (replace with your details)
git config --global user.name "Your Name"
git config --global user.email "your.email@gmail.com"

# Add all files
git add .

# Commit
git commit -m "Initial commit: Complete Slumpers e-commerce and event platform"

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/slumpers-website.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## 🎉 Success!

Your Slumpers website is now on GitHub! 

**Repository URL**: `https://github.com/YOUR_USERNAME/slumpers-website`

Next steps:
1. **Deploy to Vercel** using the deployment guides
2. **Configure environment variables**
3. **Test all features**
4. **Go live!** 🚀

Your complete e-commerce and event platform is ready to serve Kenya's Gen Z community! 🇰🇪✨
