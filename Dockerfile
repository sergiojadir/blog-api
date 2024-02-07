FROM ruby:3.0.3-alpine

RUN apk add --update --no-cache git gcc build-base libpq-dev tzdata shared-mime-info nodejs

WORKDIR /blog-api

RUN gem install bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

COPY . .

EXPOSE 3000
