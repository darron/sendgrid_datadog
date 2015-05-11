FROM octohost/ruby:2.1.6

ENV PORT 3000

RUN apt-get update && apt-get install -y make build-essential ; \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /srv/www

ADD . /srv/www

WORKDIR /srv/www

RUN bundle install

EXPOSE 3000

CMD foreman start web
