FROM ruby:2.4.10

RUN printf '%s\n' \
  'deb http://archive.debian.org/debian buster main' \
  'deb http://archive.debian.org/debian-security buster/updates main' \
  > /etc/apt/sources.list \
  && printf '%s\n' 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99archive \
  && apt-get update \
  && apt-get install -y --no-install-recommends nodejs postgresql-client \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test --jobs 4 --retry 3

COPY . .

ENV RAILS_ENV=production \
  RAILS_LOG_TO_STDOUT=1 \
  RAILS_SERVE_STATIC_FILES=1

RUN SECRET_KEY_BASE=assets DATABASE_URL=postgres://dinnizer:dummy@localhost/dinnizer_production bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
