release: bundle exec rails db:prepare db:prepare:queue db:prepare:cache db:prepare:cable db:seed
web: bundle exec thrust puma -C config/puma.rb
worker: bundle exec rake solid_queue:start
