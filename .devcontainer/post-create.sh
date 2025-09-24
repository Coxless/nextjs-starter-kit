#!/bin/bash

## mise インストール
curl https://mise.run | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(mise activate bash)"' >> $HOME/.bashrc

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
