#!/usr/bin/env bash
. $(brew --prefix asdf)/libexec/asdf.sh
asdf global nodejs latest
npm install -g \
  commitizen \
  cz-emoji \
  yarn
