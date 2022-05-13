FROM ruby:3.1.1

RUN apt-get update && apt-get install -y \
 build-essential libpq-dev nodejs zlib1g-dev liblzma-dev

WORKDIR /app

COPY . . 

RUN bundle install

CMD bundle exec rails s -p 3000 -b '0.0.0.0'