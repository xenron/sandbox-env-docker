FROM ruby:2.2.3

RUN gem install unicorn
WORKDIR /app

COPY . /app

VOLUME /var/run/unicorn

CMD unicorn -l /var/run/unicorn/unicorn.sock
