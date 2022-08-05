#!/bin/bash

set -e

mkcert -install
mkcert -cert-file certs/astons.dev_cert.pem -key-file certs/astons.dev_key.pem "astons.dev" "*.astons.dev"

if [[ ! $(docker network ls -f name=loproxy -q) ]]; then
  docker network create loproxy
fi
docker-compose up -d

