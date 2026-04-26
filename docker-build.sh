#!/bin/sh

VERSION=8.4.9

docker buildx build \
  --build-arg VERSION=${VERSION} \
  --file "Dockerfile" \
  --platform linux/amd64,linux/arm64/v8 \
  --progress plain \
  --provenance=mode=max \
  --pull \
  --sbom=true \
  --tag "docker.io/zelexio/mysql-community-client:${VERSION}" \
  --tag "docker.io/zelexio/mysql-community-client:latest" \
  --tag "ghcr.io/zelexio-ce/mysql-community-client:${VERSION}" \
  --tag "ghcr.io/zelexio-ce/mysql-community-client:latest" \
  "${@}" \
  "."

docker scout cves \
  --locations \
  --format markdown \
  --output "vuln/vuln-mysql-community-client:${VERSION}.md" \
  "${tag}"
