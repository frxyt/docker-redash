# Copyright (c) 2021 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2021 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-redash> for details.

ARG FRX_REDASH_VERSION=10.1.0.b50633
FROM redash/redash:${FRX_REDASH_VERSION}

LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"
ARG FRX_BUILD_COMMIT_DATE=0000-00-00
ARG FRX_BUILD_COMMIT_SHA=0000000
ARG FRX_REDASH_VERSION=10.1.0.b50633
ENV FRX_BUILD_COMMIT_DATE=${FRX_BUILD_COMMIT_DATE} \
    FRX_BUILD_COMMIT_SHA=${FRX_BUILD_COMMIT_SHA} \
    FRX_REDASH_VERSION=${FRX_REDASH_VERSION}

USER root
RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        gnutls-bin; \
    rm -rf /var/lib/apt/lists/*; \
    pip install --upgrade \
        memsql \
        mysqlclient;
USER redash