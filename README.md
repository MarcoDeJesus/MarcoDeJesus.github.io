# Marco De Jesus - Portfolio Website

A modern, professional Jekyll-based portfolio website showcasing 14+ years of experience in software engineering, QA automation, and AI-powered test automation.

## 🌐 Live Site

Visit the live site at: [https://marcodejesus.github.io](https://marcodejesus.github.io)

## 🚀 Features

- **Modern Design**: Clean, professional layout with smooth animations
- **Responsive**: Fully responsive design that works on all devices
- **Fast Loading**: Optimized for performance and SEO
- **GitHub Pages Ready**: Configured for easy deployment on GitHub Pages
- **Success Stories**: Highlights quantifiable achievements and business impact
- **AI Expertise**: Showcases cutting-edge work with Cursor AI, MCP, and LLM integration

## 📋 Sections

1. **Hero Section**: Eye-catching introduction with key achievements
2. **About**: Professional profile and core competencies
3. **Experience**: Detailed work history with success stories and metrics
4. **Skills**: Technical skills organized by category
5. **Projects**: Key projects and major achievements
6. **Education & Certifications**: Academic background and professional certifications
7. **Contact**: Contact information and social links

## 🛠️ Setup & Installation

### Prerequisites

- Ruby (version 2.7 or higher)
- RubyGems
- Bundler

### Local Development

1. **Clone the repository** (or navigate to the portfolio-website directory):
   ```bash
   cd portfolio-website
   ```

2. **Install dependencies**:
   ```bash
   bundle install
   ```

3. **Build and serve the site locally**:
   ```bash
   bundle exec jekyll serve
   ```

4. **View the site**:
   Open your browser and navigate to `http://localhost:4000`

### Build for Production

```bash
bundle exec jekyll build
```

The generated site will be in the `_site` directory.

## 📦 Deployment to GitHub Pages

### Option 1: Automatic Deployment (Recommended)

1. **Push the repository to GitHub**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/marcodejesus/marcodejesus.github.io.git
   git push -u origin main
   ```

2. **Enable GitHub Pages**:
   - Go to your repository settings on GitHub
   - Navigate to "Pages" in the left sidebar
   - Select the source branch (usually `main` or `gh-pages`)
   - Select the folder (`/ (root)` or `/docs` if using docs folder)
   - Click "Save"

3. **GitHub Actions** (if using):
   - GitHub Pages will automatically build and deploy your Jekyll site
   - The site will be available at `https://marcodejesus.github.io`

### Option 2: Manual Deployment

1. **Build the site**:
   ```bash
   bundle exec jekyll build
   ```

2. **Push the `_site` folder** to the `gh-pages` branch:
   ```bash
   git subtree push --prefix _site origin gh-pages
   ```

## 📝 Customization

### Update Content

- **Personal Information**: Edit `_data/contact.yml`
- **Work Experience**: Edit `_data/experience.yml`
- **Skills**: Edit `_data/skills.yml`
- **Education**: Edit `_data/education.yml`
- **Certifications**: Edit `_data/certifications.yml`

### Customize Design

- **Colors**: Edit `_sass/_variables.scss` to change the color scheme
- **Typography**: Modify font families in `_sass/_variables.scss`
- **Layout**: Adjust spacing and layout in `_sass/_layout.scss` and `_sass/_components.scss`

### Add Resume PDF

1. Place your resume PDF in the root directory as `enhanced_resume.pdf`
2. The download links will automatically work

## 🎨 Design Features

- **Color Scheme**: Professional blue (#2563eb) with teal accents
- **Typography**: Inter font family for modern, readable text
- **Layout**: Card-based design with smooth hover effects
- **Animations**: Smooth scroll navigation and fade-in animations
- **Responsive**: Mobile-first design that adapts to all screen sizes

## 📱 Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## 🔧 Troubleshooting

### Jekyll won't start

- Make sure Ruby and Bundler are installed
- Run `bundle install` to install dependencies
- Check Ruby version: `ruby -v` (should be 2.7+)

### Styles not loading

- Ensure SCSS files are in `_sass/` directory
- Check that `assets/css/main.scss` has the front matter (`---`)
- Rebuild the site: `bundle exec jekyll build`

### GitHub Pages not updating

- Check that GitHub Pages is enabled in repository settings
- Verify the source branch is correct
- Wait a few minutes for GitHub to rebuild (can take up to 10 minutes)

## 📄 License

This portfolio website is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

This is a personal portfolio website. If you'd like to use it as a template for your own portfolio, feel free to fork and customize it!

## 📧 Contact

- **Email**: marco_dejesus@live.com
- **LinkedIn**: [Marco Antonio De Jesus Ciriaco](https://www.linkedin.com/in/marco-antonio-de-jesus-ciriaco/)
- **GitHub**: [@marcodejesus](https://github.com/marcodejesus)
- **Portfolio**: [marcodejesus.github.io](https://marcodejesus.github.io)

---

Built with ❤️ using Jekyll

