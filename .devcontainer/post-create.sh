#!/bin/bash

echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/$USERNAME/.bashrc
echo 'eval "$(mise activate bash)"' >> /home/$USERNAME/.bashrc

source /home/$USERNAME/.bashrc

# Trust and install with mise
mise trust
mise install

# Install @aikidosec/safe-chain globally with pnpm
npm install -g @aikidosec/safe-chain
safe-chain setup
