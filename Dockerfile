FROM ruby:2.2.3
MAINTAINER Konstantin Zub "hello@zubkonst.com"

RUN mkdir /simple_rack
WORKDIR /simple_rack

ADD Gemfile /simple_rack/Gemfile
ADD Gemfile.lock /simple_rack/Gemfile.lock
RUN bundle install

ADD . /simple_rack

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
