#
# Distributed.net Client Dockerfile
#
# https://github.com/recklessop/dnetc-client
#

# Pull base image.
FROM ubuntu:20.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y curl nano tar && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /app

ARG arch

# Download and extract Distributed.net Client
RUN \
  mkdir dnetc temp && \
  echo $arch

RUN \
  curl -o dnetc.tar.gz http://http.distributed.net/pub/dcti/current-client/dnetc-linux-${arch}.tar.gz && \
  tar xzvf dnetc.tar.gz -C temp && \
  find temp -type f -exec mv -i {} dnetc \; && \
  rm -r temp

# Add dnetc.ini config file.
ADD dnetc.ini /app/dnetc/dnetc.ini

# Set environment variables.
ENV HOME /root/dnetc

WORKDIR /app/dnetc

# Define default command.
CMD ["./dnetc"]
