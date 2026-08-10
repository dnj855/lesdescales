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

Development uses [direnv](https://direnv.net): variables live in `.envrc` (gitignored).
There is no `.env` / `.env.local` in this project.

```bash
cat > .envrc << 'EOF'
export CLOUDINARY_URL="cloudinary://<api_key>:<api_secret>@<cloud_name>"
EOF
direnv allow
```

Notes:

- The `cloudinary` gem reads **`CLOUDINARY_URL`** only — not
  `CLOUDINARY_CLOUD_NAME` / `_API_KEY` / `_API_SECRET`. Without it,
  `Cloudinary.config.cloud_name` is `nil` and URL generation raises
  `CloudinaryException: Must supply cloud_name`. Copy staging's value:
  `ssh eden-labs "docker exec lesdescales-web_staging-1 printenv CLOUDINARY_URL"`.
- No `DATABASE_URL` is needed: `config/database.yml` targets `lesdescales_development`
  over the local socket.
- Do **not** generate a `RAILS_MASTER_KEY` with `rails secret` — that produces a random
  key that cannot decrypt the committed `config/credentials.yml.enc`. Get the real key
  from staging if you need it (`printenv RAILS_MASTER_KEY`). It is not required to run
  the app in development.

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

#### Seed Initial Data — ⚠️ fresh database only
```bash
# Run Spina installation
rails spina:install

# You'll be prompted to create an admin user:
# Email: admin@lesdescales.fr
# Password: [choose secure password]
```

⚠️ `rails spina:install` **rewrites `config/initializers/spina.rb` from the gem's
template**, discarding this project's settings (`config.locales = [:fr]`,
`backend_title`…). Never run it on an existing install. If you already did:
`git restore config/initializers/spina.rb`.

#### Replicate staging instead (recommended)

Staging is the source of truth for content — clients fill it in, and it is later cloned
to production. Skip `spina:install` and copy staging's state:

```bash
# 1. Dump from the app container (it ships psql and holds its own DATABASE_URL;
#    the database itself lives on the VPS's shared postgresql-server)
ssh eden-labs 'docker exec lesdescales-web_staging-1 sh -c "pg_dump -Fc \$DATABASE_URL"' > /tmp/staging.dump

# 2. Restore. --no-owner belongs on pg_restore, not pg_dump: in custom format pg_dump
#    ignores it and the archive keeps its ALTER ... OWNER TO lesdescales statements
dropdb --if-exists lesdescales_development && createdb lesdescales_development
pg_restore --no-owner --no-privileges -d lesdescales_development /tmp/staging.dump

# 3. Match staging's secret_key_base — mandatory, or every image 404s
#    (see Troubleshooting → Images return 404 after a database dump)
ssh eden-labs 'docker exec lesdescales-web_staging-1 bin/rails runner "print Rails.application.secret_key_base"' > tmp/local_secret.txt
```

Then set `CLOUDINARY_URL` in `.envrc` and restart `bin/dev`.

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

#### Images return 404 after a database dump

Symptom: pages render their `<img>` tags, but every
`/rails/active_storage/representations/redirect/...` URL returns 404. The log shows no
exception, only:

```
Filter chain halted as :set_blob rendered or redirected
Completed 404 Not Found in 1ms (ActiveRecord: 0.0ms)
```

`ActiveRecord: 0.0ms` is the tell: no query ran, so the blob is not missing — the
**signature failed to verify**. Restarting the server does not help.

Cause: Spina 2.20 stores page content in the jsonb column
`spina_pages.json_attributes` (**not** in `spina_page_parts`, a legacy table that stays
empty — do not read its zero count as "no content"). For images it persists a hardcoded
`signed_blob_id`:

```json
{"name": "home_banner_image", "type": "Spina::Parts::Image",
 "image_id": 8, "signed_blob_id": "eyJ…--c9b528cf…"}
```

That signature depends on the `secret_key_base` of whichever environment saved the page.
A dump carries it verbatim, so any environment with a different secret cannot verify it.

Fix — align the local secret with staging's:

```bash
ssh eden-labs 'docker exec lesdescales-web_staging-1 bin/rails runner "print Rails.application.secret_key_base"' > tmp/local_secret.txt
```

Then restart `bin/dev`. Note that adding `config/master.key` does **not** fix this: in
development Rails ignores credentials and reads only `tmp/local_secret.txt`
(`Rails.env.local?` → `generate_development_secret`).

To confirm the diagnosis, sign a URL locally and request it — a 302 proves the
verifier uses `tmp/local_secret.txt` while the stored signature does not:

```bash
rails runner 'puts ActiveStorage::Blob.find(26).signed_id'
```

#### Cloudinary: "Must supply cloud_name"

`CLOUDINARY_URL` is not set in the current shell. It lives in `.envrc`; run
`direnv allow`. The `cloudinary` gem reads that single variable — not
`CLOUDINARY_CLOUD_NAME` / `_API_KEY` / `_API_SECRET`.

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

⚠️ **Production must share staging's `secret_key_base`.** Page content is copied from
staging by database dump, and `Spina::Parts::Image` stores a `signed_blob_id` computed
from the signing environment's secret (see *Images return 404 after a database dump*).
A production instance with its own secret cannot verify those signatures, and **every
image on the site returns 404** — with no error in the logs beyond a filter-chain halt.
Deploy production with the same `RAILS_MASTER_KEY` as staging so both resolve
`secret_key_base` from the shared `config/credentials.yml.enc`.

### Pre-deployment Checklist
- [ ] Set all environment variables
- [ ] Confirm `secret_key_base` matches staging (else all images 404)
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