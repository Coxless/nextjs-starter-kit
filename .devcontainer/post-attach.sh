#!/bin/bash

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
