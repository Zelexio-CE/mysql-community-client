FROM almalinux:10

ARG VERSION

LABEL org.opencontainers.image.push=false
LABEL org.opencontainers.image.registry="zelexio/mysql-community-client"

LABEL org.opencontainers.image.description="The latest stable MySQL Community Client on Debian"
LABEL org.opencontainers.image.source="https://github.com/Zelexio-CE/mysql-community-client"
LABEL org.opencontainers.image.title="MySQL Community Client"
LABEL org.opencontainers.image.url="https://github.com/Zelexio-CE/mysql-community-client"
LABEL org.opencontainers.image.vendor="Zelexio"
LABEL org.opencontainers.image.version="${VERSION}"

USER root

COPY ./root /

RUN \
dnf install -y mysql-community-client-${VERSION} && \
dnf clean all

USER nobody

CMD ["tail", "-f", "/dev/null"]
