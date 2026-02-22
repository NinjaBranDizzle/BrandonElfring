release: bundle exec rails db:prepare
web: bundle exec thrust puma -C config/puma.rb
worker: bundle exec rake solid_queue:start
