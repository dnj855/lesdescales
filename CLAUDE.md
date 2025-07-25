# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Ruby on Rails 7.1.5+ website for "Les Dés'Calés", a board game association. The site uses **Spina CMS** for content management and **Tailwind CSS 4** for styling. The project is configured for PostgreSQL and includes Cloudinary for media management.

## Development Commands

### Database Setup
```bash
# Create database and run migrations
rails db:create
rails active_storage:install
rails db:migrate

# Install Spina CMS (creates admin interface)
rails spina:install

# Kill postgres connections (custom rake task)
rails kill_postgres_connections
```

### Development Server
```bash
# Start the Rails server
rails server
# Site available at: http://localhost:3000
# Admin interface at: http://localhost:3000/admin
```

### Code Quality
```bash
# Run RuboCop for linting
rubocop
```

### Testing
```bash
# Run Rails tests
rails test

# For system tests (uses Capybara + Selenium)
rails test:system
```

## Architecture Overview

### CMS Integration
- **Spina CMS** is mounted at root path (`/`) in `config/routes.rb`
- All content is managed through Spina's admin interface
- Custom theme configuration in `config/initializers/themes/default.rb`

### Theme Structure
The Spina theme is configured with:
- **View templates**: homepage, mascotte, festival, animations, gallery_index, contact, adhesion, legal
- **Resources**: animations and festival_editions (managed as collections)
- **Custom pages**: Pre-configured pages that cannot be deleted
- **Parts**: Reusable content blocks (Line, Text, Image, ImageCollection, etc.)

### Key Directories
```
app/
├── views/default/           # Spina theme templates
│   ├── pages/              # Page templates
│   └── shared/             # Navigation and footer partials
├── assets/
│   ├── builds/             # Compiled CSS
│   └── stylesheets/        # Source stylesheets
└── javascript/             # Stimulus controllers

config/
├── initializers/themes/    # Spina theme configuration
└── routes.rb              # Routes (Spina mounted at root)
```

### Design System
- Colors: Primary red (#E31507), light yellow background (#FFE698)
- Fonts: Feeling Passionate (display), Poppins (headings), Sniglet (body)
- Component styles documented in `DESIGN_SYSTEM.md`

### Database
- PostgreSQL with Spina CMS tables
- Active Storage for file uploads
- Custom rake task to kill postgres connections for db operations

## Important Notes

- The site uses Spina CMS for all content management
- All pages are rendered through Spina's routing system
- Tailwind CSS 4 is used for styling
- Font Awesome 6.7.2 is loaded via CDN for icons
- Cloudinary integration for optimized media handling
- Docker configuration available for deployment