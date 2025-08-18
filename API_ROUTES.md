# Les Dés'Calés - API & Routes Documentation

## 🚦 Routes Overview

The application uses Rails routing with Spina CMS mounted at the root path.

### Route Configuration

```ruby
Rails.application.routes.draw do
  mount Spina::Engine => '/'
  get "up" => "rails/health#show", as: :rails_health_check
end
```

---

## 📍 Public Routes

### Health Check
```
GET /up
```
- **Purpose**: Health monitoring endpoint
- **Response**: 200 OK if application is healthy
- **Usage**: Load balancers, uptime monitors

---

## 🎨 Spina CMS Routes

All content routes are handled by Spina CMS engine mounted at root.

### Public Pages

| Route | Template | Description |
|-------|----------|-------------|
| `/` | homepage | Main landing page |
| `/mascotte` | mascotte | Mascot information |
| `/festival` | festival | Annual festival page |
| `/animations` | animations | Activities listing |
| `/galleries` | gallery_index | Photo galleries |
| `/contact` | contact | Contact information |
| `/adhesion` | adhesion | Membership page |
| `/legal` | legal | Legal notices |

### Dynamic Resources

#### Animations
```
GET /animations/:id
```
- **Template**: animation_show
- **Content**: Individual animation details
- **Parts**: title, description, gallery

#### Festival Editions
```
GET /festival/:id
```
- **Template**: festival_edition_show
- **Content**: Specific festival edition
- **Parts**: title, description, gallery

---

## 🔐 Admin Routes

### Spina Admin Panel
```
GET /admin
```
- **Authentication**: Required
- **Access**: Admin users only
- **Features**:
  - Page management
  - Media library
  - Navigation editor
  - User management
  - Settings

### Admin Sub-routes

| Route | Purpose |
|-------|---------|
| `/admin/pages` | Manage CMS pages |
| `/admin/pages/:id/edit` | Edit specific page |
| `/admin/media_library` | Manage images/files |
| `/admin/navigations` | Configure menus |
| `/admin/users` | User management |
| `/admin/settings` | Global settings |

---

## 🔄 API Endpoints

### Content API (via Spina)

While not REST API by default, Spina content can be accessed programmatically:

#### Page Content
```ruby
# Controller method to fetch page data
Spina::Page.find_by(url_title: 'homepage')
```

#### Available Data Methods

```ruby
# Get page parts
page.content(:home_banner_image)
page.content(:home_who_we_are_text)

# Get resources
Spina::Resource.find_by(name: 'animations')

# Get navigation items
Spina::Navigation.find_by(name: 'main').navigation_items
```

---

## 🌐 External Integrations

### HelloAsso Integration
- **Type**: Embedded iframe
- **Location**: Homepage adhesion section
- **Configuration**: Via CMS `home_adhesion_embed` part

### MyLudo Integration
- **Type**: External link
- **URL**: Configured in `home_myludo_url` part
- **Target**: New window

---

## 🎯 URL Patterns

### SEO-Friendly URLs
- Pages use `url_title` for slugs
- Resources use configurable slugs
- No file extensions in URLs
- UTF-8 support for French characters

### URL Structure

```
/                          # Homepage
/[page-slug]              # Static pages
/animations/[slug]        # Animation details
/festival/[year-slug]     # Festival editions
```

---

## 🔧 Route Helpers

### Rails Path Helpers

```ruby
# Health check
rails_health_check_path  # => "/up"

# Spina pages (dynamic)
spina.page_path(page)
spina.edit_admin_page_path(page)
```

### JavaScript Routes

For Stimulus controllers:
```javascript
// Navigate to page
window.location.href = '/animations';

// Turbo navigation
Turbo.visit('/contact');
```

---

## 📊 Route Middleware

### Application Middleware Stack

1. **SSL Enforcement** (production)
2. **CSRF Protection**
3. **Content Security Policy**
4. **Permissions Policy**
5. **Parameter Filtering**

### Request Processing

```
Request → Rack Middleware → Rails Router → Spina Engine → Controller → View → Response
```

---

## 🚀 Performance Considerations

### Route Optimization
- Spina handles route caching
- Database queries optimized with includes
- Static assets served via CDN
- Turbo prevents full page reloads

### Caching Strategy
```ruby
# Page fragment caching (when enabled)
cache(page) do
  render page.content
end
```

---

## 🔒 Security

### Protected Routes
- All `/admin/*` routes require authentication
- CSRF tokens required for state-changing operations
- SSL enforced in production

### Parameter Filtering
```ruby
# Filtered in logs
config.filter_parameters += [:password, :password_confirmation]
```

---

## 📝 Custom Route Examples

### Adding Custom Routes

To add custom routes alongside Spina:

```ruby
Rails.application.routes.draw do
  # Custom routes before Spina
  namespace :api do
    resources :events
  end
  
  # Spina CMS catches all remaining routes
  mount Spina::Engine => '/'
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
```

### Creating API Endpoints

Example custom API controller:
```ruby
class Api::EventsController < ApplicationController
  def index
    events = fetch_events_from_spina
    render json: events
  end
  
  private
  
  def fetch_events_from_spina
    Spina::Page.where(view_template: 'event').map do |page|
      {
        title: page.content(:title),
        description: page.content(:description),
        date: page.content(:event_date)
      }
    end
  end
end
```

---

## 🧪 Testing Routes

### Route Testing Examples

```ruby
# Test public routes
test "should get homepage" do
  get root_url
  assert_response :success
end

test "should get health check" do
  get rails_health_check_url
  assert_response :success
end

# Test admin routes (requires authentication)
test "should redirect to login for admin" do
  get '/admin'
  assert_response :redirect
end
```

---

## 📚 Additional Resources

- [Rails Routing Guide](https://guides.rubyonrails.org/routing.html)
- [Spina CMS Documentation](https://spinacms.com/docs)
- [Turbo Documentation](https://turbo.hotwired.dev/)

---

*Generated for Les Dés'Calés project - deployment branch*