FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# 必要最低限のツールとsudoをインストール
RUN apt-get update && apt-get install -y \
    curl git unzip ca-certificates gnupg sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# developerユーザー作成
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# developerユーザーに切り替え
USER $USERNAME

# mise インストール（rootでインストール）
RUN curl https://mise.run | bash
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/$USERNAME/.bashrc
