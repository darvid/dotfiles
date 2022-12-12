#!/usr/bin/env bash
export NONINTERACTIVE=1

# Install Homebrew (Linuxbrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install fish shell
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt -y update
sudo apt -y install fish

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install NVM
brew install nvm
mkdir -p "$HOME/.nvm"
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
nvm install node

# Install Rust
export RUSTUP_INIT_SKIP_PATH_CHECK=yes
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sudo sh -s -- -y

# Install Python build deps
sudo apt -y update
sudo apt -y install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install nerd-fonts dependencies
sudo apt -y install fontforge python3-fontforge

# Install pyenv
brew install pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.11.1

# Install tpm
mkdir -p "$HOME/.tmux"
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
