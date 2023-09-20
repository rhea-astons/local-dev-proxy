#!/bin/bash

set -e

requirements=("mkcert" "docker" "docker-compose")
for requirement in $requirements; do
  if [[ -z $(command -v $requirement) ]]; then
    echo "ERROR: $requirement is missing."
    exit 1
  fi
done

mkcert -install
mkcert -cert-file certs/dev.astons.me_cert.pem -key-file certs/dev.astons.me_key.pem "dev.astons.me" "*.dev.astons.me"

if [[ ! $(docker network ls -f name=loproxy -q) ]]; then
  docker network create loproxy
fi
docker-compose up -d

