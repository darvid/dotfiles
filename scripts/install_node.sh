#!/usr/bin/env bash
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
nvm install node

npm install -g \
  commitizen \
  cz-emoji \
  yarn

npm audit fix --force
