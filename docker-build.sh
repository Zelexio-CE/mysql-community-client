#!/bin/sh

VERSION=8.4.8

docker buildx build \
  --build-arg VERSION=${VERSION} \
  --file "Dockerfile" \
  --platform linux/amd64,linux/arm64/v8 \
  --progress plain \
  --provenance=true \
  --pull \
  --sbom=true \
  --tag "zelexio/mysql-community-client:${VERSION}" \
  --tag "zelexio/mysql-community-client:latest" \
  "${@}" \
  "."
