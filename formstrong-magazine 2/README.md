# FormStrong Magazine

*Curating the Most Pertinent Reposts of Our Times*

A digital magazine built with Jekyll and hosted on GitHub Pages for **FREE**. Features automated deployment, professional layouts, and print-ready export capabilities.

## 🚀 Quick Start (5 Minutes)

### 1. Create GitHub Repository
```bash
# Go to github.com/new
# Repository name: formstrong-magazine
# Make it public
# Initialize with README
```

### 2. Clone & Setup Locally
```bash
git clone https://github.com/yourusername/formstrong-magazine.git
cd formstrong-magazine

# Copy all the files from this directory to your repo
# Then commit and push

git add .
git commit -m "Initial FormStrong Magazine setup"
git push origin main
```

### 3. Enable GitHub Pages
1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Source: **GitHub Actions**
4. Your site will be available at: `https://yourusername.github.io/formstrong-magazine`

### 4. Local Development (Optional)
```bash
# Install Jekyll (one-time setup)
gem install bundler jekyll

# Install dependencies
bundle install

# Run locally
bundle exec jekyll serve

# Visit: http://localhost:4000
```

## 📝 Adding New Content

### Easy Method: Use the Script
```bash
ruby add-repost.rb
# Follow the prompts to add a new repost
```

### Manual Method: Create Files
1. Copy a file from `_reposts/` folder
2. Update the frontmatter and content
3. Save with a descriptive filename

## 📁 Site Structure

```
formstrong-magazine/
├── _config.yml          # Site configuration
├── _layouts/
│   ├── issue.html       # Magazine issue layout
│   └── repost.html      # Individual repost layout
├── _issues/             # Monthly magazine issues
│   └── issue-1.md       # Sample first issue
├── _reposts/            # Individual curated reposts
│   ├── emf-health.md
│   ├── ai-consciousness.md
│   └── attention-economy.md
├── assets/              # CSS, images, etc.
├── add-repost.rb        # Script to add new content
└── index.md             # Homepage
```

## 🎨 Customization

### Update Site Information
Edit `_config.yml`:
```yaml
title: "Your Magazine Name"
description: "Your tagline"
url: "https://yourusername.github.io"
twitter_username: "your_handle"
```

### Change Colors/Styling
All CSS is embedded in the layout files. Search for `<style>` tags and modify:
- Primary color: `#007bff` (blue)
- Background colors and spacing
- Typography and fonts

### Add Your Logo
1. Add image to `assets/images/`
2. Update logo references in layouts
3. Commit and push changes

## 📊 Monthly Workflow

### Creating a New Issue
1. Copy `_issues/issue-1.md` to `_issues/issue-2.md`
2. Update issue number, date, and theme
3. Update the sections and categories
4. Write introduction content

### Curating Reposts
1. Use `ruby add-repost.rb` for each new repost
2. Fill in all required fields
3. Add detailed analysis and commentary
4. Commit changes: `git add . && git commit -m "Add issue 2 reposts"`

### Publishing
```bash
git push origin main
# GitHub Actions automatically builds and deploys
# Live in 2-3 minutes at your GitHub Pages URL
```

## 🖨️ Print & Exhibition Features

### Generate PDF
The site is print-ready with CSS print styles:
1. Visit any issue page
2. Use browser: **File → Print → Save as PDF**
3. Settings: A4 size, include background graphics

### QR Codes for Physical Exhibition
Each repost page can generate QR codes linking to:
- Original posts
- Your analysis
- Full magazine issues

### Exhibition Layouts
The CSS includes specific styling for:
- Large format printing
- Gallery wall displays  
- Mobile-friendly viewing at exhibitions

## 💰 Total Cost: FREE

**What's Included:**
- ✅ Professional magazine layouts
- ✅ Automated deployment
- ✅ Mobile-responsive design
- ✅ SEO optimization
- ✅ Print-ready PDF export
- ✅ Unlimited bandwidth/storage (GitHub limits)
- ✅ Custom domain support (optional)
- ✅ Version control for all content

**Optional Upgrades:**
- Custom domain: ~$12/year
- Professional email: ~$6/month
- Advanced analytics: Free (Google Analytics)

## 🔧 Advanced Features

### Social Media Integration
To automatically import from @buildft:
1. Set up Twitter API access (free tier available)
2. Use GitHub Actions to run import scripts
3. See `automation-setup.md` for details

### Custom Domain
1. Buy domain from any registrar
2. In repository settings → Pages → Custom domain
3. Add CNAME record pointing to: `yourusername.github.io`

### Analytics
Add to layouts before `</head>`:
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_TRACKING_ID');
</script>
```

## 🆘 Troubleshooting

### Site Not Building
1. Check GitHub Actions tab for errors
2. Ensure all required frontmatter is present
3. Validate YAML syntax in `_config.yml`

### Styling Issues
1. Clear browser cache
2. Check CSS syntax in layout files
3. Test locally with `bundle exec jekyll serve`

### Content Not Appearing
1. Ensure files are in correct folders (`_issues/`, `_reposts/`)
2. Check frontmatter format matches examples
3. Verify date format: `YYYY-MM-DD`

## 📞 Support

- **Issues**: Use GitHub Issues for bugs/questions
- **Community**: Connect with other Jekyll users
- **Documentation**: [Jekyll docs](https://jekyllrb.com/docs/)

---

**Ready to start curating? Your FormStrong magazine is set up and ready to go!**

🎯 **Next Steps:**
1. Customize `_config.yml` with your information
2. Create your first issue using the templates
3. Start adding reposts with `ruby add-repost.rb`
4. Push to GitHub and watch it deploy automatically!

*Signal vs. Noise starts with your first curation.*
