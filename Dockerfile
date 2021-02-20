FROM ruby:2.7.2

RUN mkdir /AnimalGraphy
ENV APP_ROOT /AnimalGraphy
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN apt-get update -qq && \
    apt-get install -y curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y build-essential imagemagick libpq-dev nodejs vim yarn && \
    gem update --system && \
    gem install bundler && \
    bundle install

COPY . $APP_ROOT
