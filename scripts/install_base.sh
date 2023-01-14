#!/usr/bin/env bash
export NONINTERACTIVE=1

# Install Homebrew (Linuxbrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install fish shell
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt -y update
sudo apt -y install fish

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install asdf
brew install asdf
asdf plugin add nodejs
asdf plugin add python
asdf plugin add rust
asdf plugin add packer https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform-ls https://github.com/asdf-community/asdf-hashicorp.git
asdf install nodejs latest
asdf install python latest
asdf install packer latest
asdf install terraform latest
asdf install terraform-ls latest
asdf install rust latest

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
