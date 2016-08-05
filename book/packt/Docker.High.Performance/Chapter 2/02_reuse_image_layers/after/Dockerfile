FROM ruby:2.2.2

ADD Gemfile /app/Gemfile
WORKDIR /app
RUN bundle install
ADD . /app

EXPOSE 9292
CMD rackup -E none
