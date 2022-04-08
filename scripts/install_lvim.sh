#!/usr/bin/env bash
function cmd_exists() {
  command -v "$@" >/dev/null 2>&1
}

[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
nvm use node

export LV_BRANCH=rolling
export PATH=$PATH:$HOME/.local/share/nvm/current/bin:$HOME/.pyenv/shims
pip install -U setuptools
if cmd_exists lvim; then
  curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh --output /tmp/install_lvim.sh
  chmod +x /tmp/install_lvim.sh
  /tmp/install_lvim.sh -y --overwrite
fi
mkdir -p $HOME/.config/lvim
