FROM ruby:2.5.1

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential nodejs yarn libpq-dev imagemagick git-all nano mysql-client vim

ENV INSTALL_PATH /amigo_secreto

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /gems

COPY . .
