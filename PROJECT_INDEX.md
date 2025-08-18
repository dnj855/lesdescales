# Les Dés'Calés - Project Documentation Index

## 📚 Table of Contents

1. [Project Overview](#project-overview)
2. [Architecture Documentation](#architecture-documentation)
3. [Technology Stack](#technology-stack)
4. [Directory Structure](#directory-structure)
5. [CMS Configuration](#cms-configuration)
6. [Frontend Components](#frontend-components)
7. [Database Schema](#database-schema)
8. [Configuration & Environment](#configuration--environment)
9. [Development Workflow](#development-workflow)
10. [Deployment Guide](#deployment-guide)

---

## 🎯 Project Overview

**Les Dés'Calés** is a board game association website built with Ruby on Rails and Spina CMS, designed to provide information about the association, events, and community activities.

### Key Features
- **Content Management**: Full CMS integration for dynamic content
- **Event Management**: Display and manage board game events
- **Photo Galleries**: Showcase community activities
- **Member Registration**: HelloAsso integration for membership
- **Game Library**: MyLudo integration for game collection

### Project Status
- **Branch**: deployment
- **Version**: Rails 7.1.5 / Ruby 3.3.5
- **CMS**: Spina 2.18
- **Last Analysis**: Current

---

## 🏗️ Architecture Documentation

### MVC Architecture

```
┌─────────────────────────────────────────────────┐
│                   CLIENT LAYER                   │
│  (Tailwind CSS, Stimulus.js, Turbo, FontAwesome)│
└─────────────────┬───────────────────────────────┘
                  │
┌─────────────────▼───────────────────────────────┐
│              PRESENTATION LAYER                  │
│         (ERB Views, Layouts, Partials)          │
└─────────────────┬───────────────────────────────┘
                  │
┌─────────────────▼───────────────────────────────┐
│             APPLICATION LAYER                    │
│    (Controllers, Helpers, Spina Engine)         │
└─────────────────┬───────────────────────────────┘
                  │
┌─────────────────▼───────────────────────────────┐
│               BUSINESS LAYER                     │
│        (Models, Services, Validators)           │
└─────────────────┬───────────────────────────────┘
                  │
┌─────────────────▼───────────────────────────────┐
│                DATA LAYER                        │
│     (PostgreSQL, Active Storage, Cloudinary)    │
└─────────────────────────────────────────────────┘
```

### Request Flow

1. **Request** → Puma Server
2. **Routing** → Rails Router → Spina Engine Mount
3. **Controller** → ApplicationController or Spina Controllers
4. **Model** → Spina Models (Pages, Parts, Resources)
5. **View** → Theme-based ERB templates
6. **Response** → HTML with Turbo/Stimulus enhancements

---

## 💻 Technology Stack

### Backend
| Technology | Version | Purpose |
|------------|---------|---------|
| Ruby | 3.3.5 | Programming language |
| Rails | 7.1.5 | Web framework |
| Spina | 2.18 | Content Management System |
| PostgreSQL | Latest | Database |
| Puma | 5.0+ | Application server |

### Frontend
| Technology | Version | Purpose |
|------------|---------|---------|
| Tailwind CSS | 4.x | Utility-first CSS framework |
| Stimulus.js | Latest | Modest JavaScript framework |
| Turbo | Latest | SPA-like page acceleration |
| ImportMaps | Latest | ESM module management |
| FontAwesome | Latest | Icon library |

### Infrastructure
| Service | Purpose |
|---------|---------|
| Cloudinary | Image storage and CDN |
| HelloAsso | Membership management |
| MyLudo | Game library integration |

---

## 📁 Directory Structure

```
lesdescales/
├── app/
│   ├── assets/
│   │   ├── builds/         # Compiled CSS
│   │   ├── fonts/          # Custom fonts (Feeling Passionate)
│   │   ├── images/         # Static images
│   │   ├── stylesheets/    # Source stylesheets
│   │   └── tailwind/       # Tailwind configuration
│   ├── controllers/        # Rails controllers
│   ├── helpers/           # View helpers
│   ├── javascript/        # Stimulus controllers
│   ├── models/            # ActiveRecord models
│   └── views/
│       ├── default/       # Theme views
│       │   ├── pages/     # Page templates
│       │   └── shared/    # Shared partials
│       └── layouts/       # Application layouts
├── config/
│   ├── environments/      # Environment configs
│   ├── initializers/      # Rails initializers
│   │   └── themes/        # Spina theme config
│   ├── locales/          # i18n translations
│   └── routes.rb         # Route definitions
├── db/
│   ├── migrate/          # Database migrations
│   └── schema.rb         # Database schema
├── public/               # Static files
└── storage/              # Active Storage files
```

---

## 🎨 CMS Configuration

### Spina Theme Structure

The CMS is configured through `/config/initializers/themes/default.rb`:

#### Available Page Templates
1. **homepage** - Main landing page with bento grid
2. **mascotte** - Mascot information page
3. **festival** - Annual festival page
4. **animations** - Activities listing
5. **gallery_index** - Photo galleries
6. **contact** - Contact information
7. **adhesion** - Membership registration
8. **legal** - Legal notices

#### Content Parts
- **Text Parts**: Title, description, rich text areas
- **Image Parts**: Banners, posters, galleries
- **Integration Parts**: HelloAsso embed, MyLudo URL
- **Social Parts**: Facebook, Instagram, YouTube URLs

#### Resources
- **Animations**: Individual activity pages
- **Festival Editions**: Historical festival editions

---

## 🎨 Frontend Components

### Design System

Based on `DESIGN_SYSTEM.md`:

#### Color Palette
- **Primary Red**: #E31507
- **Light Yellow**: #FFE698
- **Dark Red**: #B80F05 (hover states)
- **Pale Yellow**: #FFF9E0 (backgrounds)
- **Warm Orange**: #FF8A00 (accents)

#### Typography
- **Display Font**: Feeling Passionate (custom)
- **Heading Font**: Antonio (Google Fonts)
- **Body Font**: Sniglet (Google Fonts)

#### Component Library
1. **Bento Cards** - Modular grid layout system
2. **Navigation** - Responsive header with mobile menu
3. **Footer** - Social links and information
4. **Buttons** - Primary/secondary variants
5. **Forms** - Contact and registration forms

### Page Components

#### Homepage (`homepage.html.erb`)
- Banner section with responsive images
- Bento grid layout (desktop/mobile adaptive)
- "Who we are" card
- Meeting schedule card
- MyLudo integration card
- Poster display
- HelloAsso membership widget

#### Shared Components
- `_navigation.html.erb` - Main navigation
- `_footer.html.erb` - Footer with social links

---

## 🗄️ Database Schema

### Core Tables (via Spina)

```sql
-- Pages (CMS pages)
spina_pages
├── id
├── title
├── url_title (slug)
├── view_template
├── ancestry (hierarchy)
└── timestamps

-- Page Parts (Content blocks)
spina_page_parts
├── page_id
├── name
├── part_type
├── content (JSON)
└── timestamps

-- Resources (Collections)
spina_resources
├── name
├── label
├── slug
└── timestamps

-- Images (Media)
spina_images
├── media_folder_id
└── active_storage_attachment

-- Users (Admin)
spina_users
├── email
├── password_digest
└── admin (boolean)
```

---

## ⚙️ Configuration & Environment

### Environment Variables

```bash
# Database
DATABASE_URL=postgres://user:pass@localhost/db
LESDESCALES_DATABASE_PASSWORD=xxx

# Rails
RAILS_MASTER_KEY=xxx
RAILS_ENV=production
RAILS_LOG_LEVEL=info

# Storage
CLOUDINARY_URL=cloudinary://xxx

# External Services
HELLOASSO_API_KEY=xxx
MYLUDO_URL=https://xxx
```

### Key Configuration Files

| File | Purpose |
|------|---------|
| `config/database.yml` | Database configuration |
| `config/credentials.yml.enc` | Encrypted credentials |
| `config/routes.rb` | URL routing |
| `config/environments/*.rb` | Environment settings |
| `config/initializers/spina.rb` | CMS configuration |
| `Gemfile` | Ruby dependencies |

---

## 🛠️ Development Workflow

### Setup Instructions

```bash
# 1. Install dependencies
bundle install
npm install

# 2. Setup database
rails db:create
rails db:migrate
rails db:seed

# 3. Start development server
./bin/dev
# or
rails server
```

### Common Tasks

```bash
# Run tests
rails test

# Console access
rails console

# Database operations
rails db:migrate
rails db:rollback
rails db:seed

# Asset compilation
rails assets:precompile

# Linting
rubocop
```

### CMS Administration
- Access: `/admin`
- Default credentials set in seeds or environment
- Manage pages, images, and resources

---

## 🚀 Deployment Guide

### Production Checklist

#### Pre-deployment
- [ ] Set production environment variables
- [ ] Configure database credentials
- [ ] Set up Cloudinary account
- [ ] Configure domain and SSL
- [ ] Review security settings

#### Deployment Steps

```bash
# 1. Build Docker image (if using Docker)
docker build -t lesdescales .

# 2. Database setup
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:migrate

# 3. Asset compilation
RAILS_ENV=production rails assets:precompile

# 4. Start server
RAILS_ENV=production rails server
```

#### Post-deployment
- [ ] Verify SSL certificate
- [ ] Test all integrations
- [ ] Configure monitoring
- [ ] Set up backups
- [ ] Create admin users

### Security Recommendations

1. **Enable CSP** in `content_security_policy.rb`
2. **Configure rate limiting** with rack-attack
3. **Set up host authorization** for production
4. **Enable CSS/JS compression**
5. **Configure error monitoring** (Sentry/Rollbar)

---

## 📊 Monitoring & Maintenance

### Health Checks
- Endpoint: `/up`
- Returns 200 if healthy

### Logs
- Location: `log/production.log`
- Level: Configured via `RAILS_LOG_LEVEL`

### Performance Optimization
- Enable Redis caching
- Implement CDN for assets
- Optimize Tailwind bundle
- Enable Brotli compression

### Backup Strategy
- Database: Daily PostgreSQL dumps
- Images: Cloudinary automatic backup
- Code: Git repository

---

## 📝 Additional Resources

### Internal Documentation
- `DESIGN_SYSTEM.md` - UI/UX guidelines
- `README.md` - Basic project information
- `Gemfile` - Dependency documentation

### External Documentation
- [Rails Guides](https://guides.rubyonrails.org/)
- [Spina CMS Docs](https://spinacms.com/docs)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [Stimulus Handbook](https://stimulus.hotwired.dev/handbook/introduction)

### Support Contacts
- Technical issues: Check GitHub repository
- CMS support: Spina community
- Hosting: Check deployment platform docs

---

*Last Updated: Current Analysis*
*Generated for: deployment branch*