#!/bin/bash

## mise インストール（rootでインストール）
curl https://mise.run | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
export PATH="$HOME/.local/bin:$PATH"
echo 'eval "$(mise activate bash)"' >> $HOME/.bashrc
eval "$(mise activate bash)"

source $HOME/.bashrc

## Trust and install with mise
mise trust
MISE_NODE_VERIFY=0 mise install

# Find node and npm paths after mise install
NODE_PATH="$(mise which node)"
NPM_PATH="$(mise which npm)"
export PATH="$(dirname "$NODE_PATH"):$(dirname "$NPM_PATH"):$PATH"

## Install @aikidosec/safe-chain globally with pnpm
npm install -g @aikidosec/safe-chain
safe-chain setup

echo "Setup completed successfully!"
