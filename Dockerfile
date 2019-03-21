FROM ruby:2.4.0

RUN apt-get update
RUN apt-get install -y squashfs-tools bison

RUN curl -L http://enclose.io/rubyc/rubyc-linux-x64.gz | gunzip > rubyc
RUN chmod +x rubyc && cp rubyc /usr/local/bin/

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy application files
COPY ./ ./

RUN rubyc test.rb
