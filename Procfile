web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
release: rake db:migrate
worker: bundle exec sidekiq -e production -C config/sidekiq.yml
