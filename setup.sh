#!/bin/bash

set -e

mkcert -install
mkcert -cert-file certs/astons.dev_cert.pem -key-file certs/astons.dev_key.pem "astons.dev" "*.astons.dev"

