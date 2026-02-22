# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Rails 8.1 application with built-in authentication, deployed on Railway. Uses PostgreSQL, Tailwind CSS, and Hotwire (Turbo + Stimulus).

## Commands

### Development
```bash
bin/dev                    # Start server with Tailwind watcher (uses Procfile.dev)
bin/rails server           # Rails server only
```

### Testing
```bash
rspec                      # Run all specs
rspec spec/models/         # Run model specs
rspec spec/models/user_spec.rb        # Run single file
rspec spec/models/user_spec.rb:15     # Run single test at line
```

### Database
```bash
bin/rails db:create db:migrate    # Setup database
bin/rails db:reset                # Drop, create, migrate, seed
```

### Code Quality
```bash
bin/rubocop                # Lint with RuboCop (Rails Omakase style)
bin/brakeman               # Security analysis
bundle-audit check         # Check for vulnerable gems
```

## Architecture

### Authentication
Uses Rails 8's built-in authentication generator (`has_secure_password`):
- `Authentication` concern in `app/controllers/concerns/` - handles session management via signed cookies
- `Current` model - thread-safe current user/session access
- `Session` model - tracks user sessions with IP and user agent
- Controllers use `allow_unauthenticated_access` to skip auth

### Background Jobs & Caching
Uses Solid Queue, Solid Cache, and Solid Cable (database-backed adapters):
- Queue config: `config/queue.yml`
- Cache config: `config/cache.yml`
- Cable config: `config/cable.yml`

### Deployment
- Railway deployment via `railway-mcp` command
- Release command runs `db:prepare` for migrations
- Static files served via Thruster
