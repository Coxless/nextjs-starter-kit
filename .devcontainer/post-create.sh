#!/bin/sh

# Trust and install with mise
mise trust
mise install

# Install @aikidosec/safe-chain globally with pnpm
npm install -g @aikidosec/safe-chain
safe-chain setup
