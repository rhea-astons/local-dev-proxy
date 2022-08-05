# Local Development Proxy
Simple and minimalistic proxy setup for local development with docker

## Setup
Run `./setup.sh` to generate a wildcard certificate and start traefik.

## Include docker-compose projects
Use the following labels and network:
```
services:
  foobar:
    labels:
      # Enable traefik
      - "traefik.enable=true"
      # Set docker network
      - "traefik.docker.network=loproxy"
      # Set service URL
      - "traefik.http.routers.foobar.rule=Host(`foobar.astons.dev`)"
      # Enable TLS
      - "traefik.http.routers.foobar.tls=true"
      # Set port (if different from 80)
      - "traefik.http.services.foobar.loadbalancer.server.port=[port]"
    networks:
      - loproxy

networks:
  loproxy:
    external: true
```

