FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# 必要最低限のツールとsudoをインストール
RUN apt-get update && apt-get install -y \
    curl git unzip ca-certificates gnupg sudo dirmngr procps\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
