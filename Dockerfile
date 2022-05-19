FROM ruby:2.7-slim

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install curl build-essential python3-pip  && \
    gem install krane

RUN curl -sSL https://sdk.cloud.google.com | bash

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]