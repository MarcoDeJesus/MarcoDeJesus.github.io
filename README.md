# Marco De Jesus — SDET & QA Automation (GitHub Pages)

Jekyll portfolio for tech recruiters. W2 employment resume and experience (B2B/LLC path hidden via `b2b_enabled: false` in `_config.yml` until LLC is ready).

## Live Site

- **Portfolio:** [https://marcodejesus.github.io](https://marcodejesus.github.io)
- **Technical demo:** [Live demo](https://marcodejesus.github.io/ecommerce-fullstack-automation-portfolio/)
- **GitHub project:** [ecommerce-fullstack-automation-portfolio](https://github.com/MarcoDeJesus/ecommerce-fullstack-automation-portfolio)

## Page flow (landing fork)

1. **Hero** — Choose B2B or W2 path cards (scroll to dedicated section)
2. **Value Proposition** — Neutral impact statement
3. **How We Can Work Together** (`#work-with-me`) — `#path-b2b` (rates + B2B PDF) and `#path-w2` (W2 PDF)
4. **Core Competencies** — Shared skills
5. **Technical Portfolio** — Tools → business impact
6. **Technical Demo Repository** (`#demo-project`)
7. **Professional Experience** — Timeline with employment badges (W2, Contract, Contractor)
8. **Earlier Experience** — Compact history table
9. **Skills & Education**
10. **Contact** — Neutral intro; link back to path sections (no duplicate resume buttons)

## Resume PDFs

| File | Path |
|------|------|
| `Marco_DeJesus_B2B_Contractor.pdf` | Download only under `#path-b2b` |
| `Marco_DeJesus_Resume_W2.pdf` | Download only under `#path-w2` |

`enhanced_resume.pdf` is excluded from the Jekyll build.

## Local Development

```bash
cd MarcoDeJesus.github.io
bundle install
bundle exec jekyll serve
```

Open [http://localhost:4000](http://localhost:4000)

## Content (YAML)

| File | Purpose |
|------|---------|
| `_data/contact.yml` | Name, tagline, locations, social links |
| `_data/paths.yml` | B2B (US LLC / C2C / W-9) vs W2 employment resume paths |
| `_data/value_proposition.yml` | Neutral blockquote |
| `_data/engagement.yml` | B2B rate table (shown under path-b2b only) |
| `_data/resumes.yml` | PDF paths and labels |
| `_data/experience.yml` | Professional experience timeline |
| `_data/earlier_experience.yml` | Earlier roles table |
| `_data/demo_project.yml` | Demo repo, reports, clone command |

## Deploy

Push to `master` on `MarcoDeJesus/MarcoDeJesus.github.io` — GitHub Pages rebuilds automatically.

## Contact

- **Email:** marco_dejesus@live.com
- **Phone:** +1 858 933 4510
- **LinkedIn:** [Profile](https://www.linkedin.com/in/marco-antonio-de-jesus-ciriaco/)
