FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# 必要最低限のツールとsudoをインストール
RUN apt-get update && apt-get install -y \
    curl git unzip ca-certificates gnupg dirmngr sudo \
    coreutils libnss3 grep \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=1000

# ユーザー作成
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

    # ユーザーに切り替え
USER $USERNAME
WORKDIR /home/$USERNAME
