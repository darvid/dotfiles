#!/usr/bin/env bash
# Cargo plugins
cargo install \
  cargo-audit \
  cargo-bloat \
  cargo-cache \
  cargo-count \
  cargo-deny \
  cargo-edit \
  cargo-expand \
  cargo-geiger \
  cargo-graph \
  cargo-license \
  cargo-lichking \
  cargo-modules \
  cargo-outdated \
  cargo-thanks \
  cargo-tree \
  cargo-update

# Shell tools
cargo install \
  exa \
  ripgrep \
  bat \
  lsd

# Monitoring
cargo install \
  diskus \
  bottom

cargo install --url https://github.com/google/git-tree
