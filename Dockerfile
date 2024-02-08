FROM ruby:3.2.2-alpine

RUN apk add --update --no-cache git gcc build-base libpq-dev tzdata shared-mime-info nodejs

WORKDIR /blog-api

COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install

COPY . .

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
