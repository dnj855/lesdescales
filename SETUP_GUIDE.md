# Les Dés'Calés - Complete Setup Guide

## 🚀 Quick Start

### Prerequisites
- Ruby 3.3.5
- PostgreSQL 12+
- Node.js 16+
- Git

### One-Line Setup
```bash
git clone https://github.com/dnj855/lesdescales.git && cd lesdescales && bundle install && rails db:setup && ./bin/dev
```

---

## 📋 Detailed Setup Instructions

### 1. Environment Setup

#### macOS
```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install rbenv postgresql node

# Install Ruby 3.3.5
rbenv install 3.3.5
rbenv local 3.3.5

# Start PostgreSQL
brew services start postgresql
```

#### Ubuntu/Debian
```bash
# Update packages
sudo apt update && sudo apt upgrade

# Install dependencies
sudo apt install postgresql postgresql-contrib rbenv nodejs npm git

# Install Ruby 3.3.5
rbenv install 3.3.5
rbenv local 3.3.5
```

#### Windows (WSL2)
```bash
# Follow Ubuntu instructions above within WSL2
# Ensure PostgreSQL is running in WSL2
```

---

### 2. Project Setup

#### Clone Repository
```bash
git clone https://github.com/dnj855/lesdescales.git
cd lesdescales
```

#### Install Dependencies
```bash
# Ruby gems
bundle install

# If bundle fails, try:
gem install bundler
bundle install

# Install Tailwind CSS
rails tailwindcss:install
```

#### Environment Configuration
```bash
# Create .env file for development
cat > .env << EOF
DATABASE_HOST=localhost
DATABASE_USERNAME=your_username
DATABASE_PASSWORD=your_password
RAILS_MAX_THREADS=5
EOF

# Create .env.local for secrets (not committed)
cat > .env.local << EOF
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
RAILS_MASTER_KEY=$(rails secret)
EOF
```

---

### 3. Database Setup

#### Create Database
```bash
# Create database and run migrations
rails db:create
rails db:migrate

# If you encounter permission errors:
sudo -u postgres createuser -s $(whoami)
rails db:create
```

#### Seed Initial Data
```bash
# Run Spina installation
rails spina:install

# You'll be prompted to create an admin user:
# Email: admin@lesdescales.fr
# Password: [choose secure password]
```

#### Load Sample Data (Optional)
```bash
# Create seeds file if needed
rails db:seed
```

---

### 4. Asset Configuration

#### Tailwind CSS Setup
```bash
# Build Tailwind CSS
rails tailwindcss:build

# Watch for changes (development)
rails tailwindcss:watch
```

#### Custom Fonts
```bash
# Ensure custom font is in place
ls app/assets/fonts/feeling-passionate.ttf

# If missing, download and place in fonts directory
```

---

### 5. Running the Application

#### Development Server
```bash
# Option 1: Using bin/dev (recommended)
./bin/dev

# Option 2: Manual start
rails server

# Option 3: With specific port
rails server -p 3001
```

#### Access Points
- **Application**: http://localhost:3000
- **Admin Panel**: http://localhost:3000/admin
- **Health Check**: http://localhost:3000/up

---

## 🐳 Docker Setup

### Build and Run with Docker
```bash
# Build image
docker build -t lesdescales .

# Run container
docker run -p 3000:3000 \
  -e DATABASE_URL=postgresql://user:pass@host/db \
  -e RAILS_MASTER_KEY=your_master_key \
  lesdescales

# With docker-compose
docker-compose up
```

### Docker Compose Configuration
```yaml
# docker-compose.yml
version: '3.8'
services:
  db:
    image: postgres:14
    environment:
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data

  web:
    build: .
    command: rails server -b 0.0.0.0
    volumes:
      - .:/app
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      DATABASE_URL: postgresql://postgres:password@db/lesdescales

volumes:
  postgres_data:
```

---

## 🔧 Configuration Details

### Spina CMS Configuration

1. **Access Admin Panel**: http://localhost:3000/admin
2. **Default Theme**: Located in `config/initializers/themes/default.rb`
3. **Available Pages**:
   - Homepage
   - Mascotte
   - Festival
   - Animations
   - Galleries
   - Contact
   - Adhesion

### Content Management

#### Adding Content
1. Login to admin panel
2. Navigate to Pages
3. Select page template
4. Fill in content parts:
   - Text fields
   - Image uploads
   - Rich text areas

#### Managing Images
1. Go to Media Library
2. Upload images to Cloudinary
3. Organize in folders
4. Use in pages

---

## 🧪 Testing Setup

### Run Tests
```bash
# Run all tests
rails test

# Run specific test file
rails test test/models/page_test.rb

# Run with coverage
COVERAGE=true rails test
```

### Linting
```bash
# Ruby linting
rubocop

# Auto-fix issues
rubocop -a
```

---

## 🚨 Troubleshooting

### Common Issues

#### Database Connection Error
```bash
# Check PostgreSQL is running
pg_isready

# Restart PostgreSQL
brew services restart postgresql  # macOS
sudo service postgresql restart   # Linux
```

#### Bundle Install Fails
```bash
# Clear bundler cache
rm -rf ~/.bundle/cache
bundle install --force

# Use specific bundler version
gem install bundler:2.4.0
bundle _2.4.0_ install
```

#### Asset Compilation Issues
```bash
# Clear asset cache
rails assets:clobber
rails assets:precompile

# Rebuild Tailwind
rails tailwindcss:build
```

#### Spina Admin Access Issues
```bash
# Reset admin password
rails console
user = Spina::User.find_by(email: 'admin@example.com')
user.password = 'new_password'
user.save!
```

---

## 🏭 Production Setup

### Environment Variables Required
```bash
RAILS_ENV=production
RAILS_MASTER_KEY=xxx
DATABASE_URL=postgresql://user:pass@host/db
LESDESCALES_DATABASE_PASSWORD=xxx
CLOUDINARY_URL=cloudinary://xxx
RAILS_LOG_LEVEL=info
RAILS_SERVE_STATIC_FILES=true
```

### Pre-deployment Checklist
- [ ] Set all environment variables
- [ ] Configure SSL certificate
- [ ] Setup database backups
- [ ] Configure monitoring
- [ ] Test all integrations
- [ ] Review security settings

### Deployment Commands
```bash
# Prepare assets
RAILS_ENV=production rails assets:precompile

# Run migrations
RAILS_ENV=production rails db:migrate

# Start server
RAILS_ENV=production rails server
```

---

## 📚 Additional Resources

### Documentation
- `PROJECT_INDEX.md` - Complete project documentation
- `API_ROUTES.md` - Routes and API documentation
- `DESIGN_SYSTEM.md` - UI/UX guidelines

### External Links
- [Rails Guides](https://guides.rubyonrails.org/)
- [Spina CMS Documentation](https://spinacms.com/docs)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)

### Support
- GitHub Issues: Report bugs and feature requests
- Admin Email: admin@lesdescales.fr

---

*Setup guide for Les Dés'Calés - Version 1.0*