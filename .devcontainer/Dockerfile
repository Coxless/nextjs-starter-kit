FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# 必要最低限のツールとsudoをインストール
RUN apt-get update && apt-get install -y \
    curl git unzip ca-certificates gnupg sudo dirmngr \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/nodejs/release-keys.git /tmp/release-keys \
    && cd /tmp/release-keys && ./cli.sh import \
    && rm -rf /tmp/release-keys
