#!/bin/bash

## mise インストール（rootでインストール）
curl https://mise.run | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> /root/.bashrc
export PATH="$HOME/.local/bin:$PATH"
echo 'eval "$(mise activate bash)"' >> /root/.bashrc
eval "$(mise activate bash)"

source /root/.bashrc

## Trust and install with mise
mise trust
MISE_NODE_VERIFY=0 mise install

echo "Using Node: $(which node) $(node -v)"
echo "Using npm:  $(which npm)  $(npm -v)"

export NPM_PREFIX="$HOME/.npm-global"
mkdir -p "$NPM_PREFIX"
export PATH="$NPM_PREFIX/bin:$PATH"

npm config set prefix "$NPM_PREFIX"

## Install @aikidosec/safe-chain globally with pnpm
npm install -g @aikidosec/safe-chain
safe-chain setup

echo "Setup completed successfully!"
