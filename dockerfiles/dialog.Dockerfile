# syntax=docker/dockerfile:1
ARG NODE_VERSION=16.16

FROM node:${NODE_VERSION} AS dev
RUN apt-get update && apt-get install -y git build-essential python pkg-config libssl-dev python3-pip && apt-get clean
HEALTHCHECK CMD curl -f http://localhost:7000/meta || exit 1
COPY files/dev-perms.pub.pem /etc/perms.pub.pem
COPY services/reticulum/priv/dev-ssl.cert /etc/ssl/fullchain.pem
COPY services/reticulum/priv/dev-ssl.key /etc/ssl/privkey.pem
