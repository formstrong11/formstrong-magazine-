#!/bin/bash

# FormStrong Magazine - Deployment Script
# For GitHub username: formstrong11

echo "🚀 FormStrong Magazine Deployment Script"
echo "========================================"

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: Please run this script from the formstrong-magazine directory"
    exit 1
fi

echo "📁 Current directory: $(pwd)"
echo "📋 Files to deploy:"
ls -la

echo ""
echo "🔧 Setting up Git repository..."

# Initialize git if not already done
if [ ! -d ".git" ]; then
    git init
fi

# Set up remote for your GitHub repository
git remote remove origin 2>/dev/null
git remote add origin https://github.com/formstrong11/formstrong-magazine.git

echo "📦 Adding all files..."
git add .

echo "💾 Committing changes..."
git commit -m "Deploy FormStrong Magazine - $(date)"

echo "🌐 Setting main branch..."
git branch -M main

echo "🚀 Pushing to GitHub..."
echo ""
echo "⚠️  You'll need to enter your GitHub credentials when prompted"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 SUCCESS! FormStrong Magazine deployed!"
    echo ""
    echo "📍 Your site will be live at:"
    echo "   https://formstrong11.github.io/formstrong-magazine"
    echo ""
    echo "⏰ Allow 2-3 minutes for deployment to complete"
    echo ""
    echo "🔧 Next steps:"
    echo "   1. Go to: https://github.com/formstrong11/formstrong-magazine"
    echo "   2. Click: Settings → Pages"
    echo "   3. Set Source to: GitHub Actions"
    echo "   4. Wait for deployment to complete"
    echo ""
else
    echo ""
    echo "❌ Deployment failed. Please check:"
    echo "   1. GitHub repository exists: formstrong11/formstrong-magazine"
    echo "   2. Your GitHub credentials are correct"
    echo "   3. Repository is public"
    echo ""
    echo "💡 Alternative: Use the web interface at github.com"
fi
