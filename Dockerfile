FROM debian:bookworm-slim AS builder

ARG SING_BOX_VERSION="1.9.3"
ARG SING_BOX_URL="https://github.com/SagerNet/sing-box/releases/download/v${SING_BOX_VERSION}/"

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        ca-certificates \
        wget \
    && rm -rf /var/lib/apt/lists/* /var/log/* \
    \
    && ARCH=`uname -m` \
    && case "$ARCH" in \
            "x86_64") \
                SING_BOX_FILENAME="sing-box-${SING_BOX_VERSION}-linux-amd64.tar.gz" \
                ;; \
            "aarch64") \
                SING_BOX_FILENAME="sing-box-${SING_BOX_VERSION}-linux-arm64.tar.gz" \
                ;; \
        esac \
    \
    && wget -O sing-box.tar.gz "${SING_BOX_URL}${SING_BOX_FILENAME}" \
    && tar -xzvf sing-box.tar.gz \
    && mv sing-box*/sing-box /usr/local/bin/sing-box \
    && rm -rf sing-box*

######

FROM debian:bookworm-slim

COPY --from=builder /usr/local/bin/ /usr/local/bin/

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/* /var/log/*

ENTRYPOINT ["/usr/local/bin/sing-box"]