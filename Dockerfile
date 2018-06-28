FROM ruby 2.3.4p301
MAINTAINER miarhost <ritz.rkraft@gmail.com>
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev 
FROM rkraftcomua/sql2
ENV INSTALL_PATH .env
mkdir -p var/www/rails/rkraftcomua
WORKDIR var/www/rails/rkraftcomua
COPY Gemfile var/www/rails/rkraftcomua/Gemfile
COPY Gemfile.lock var/www/rails/rkraftcomua/Gemfile.lock
RUN bundle install 
RUN bundle exec rake RAILS_ENV=production 
VOLUME ["var/www/rails/rkraftcomua/public"]
CMD bundle exec puma -c config/puma.rb