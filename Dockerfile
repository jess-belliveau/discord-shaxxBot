FROM ruby:2.5.3-alpine

ENV BUILD_PACKAGES bash ruby-dev build-base libsodium libsodium-dev opus opus-dev ffmpeg

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES --no-cache

RUN mkdir /bot
RUN mkdir /bot/audio
WORKDIR /bot
ADD Gemfile /bot/Gemfile
ADD Gemfile.lock /bot/Gemfile.lock
ADD audio/* /bot/audio/
RUN bundle install
ADD . /bot
