#!/bin/bash

## mise インストール（rootでインストール）
curl https://mise.run | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(mise activate bash)"' >> /root/.bashrc

source /root/.bashrc

## Trust and install with mise
mise trust
mise install

## Install @aikidosec/safe-chain globally with pnpm
npm install -g @aikidosec/safe-chain
safe-chain setup
