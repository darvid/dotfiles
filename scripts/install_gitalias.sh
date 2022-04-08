#!/usr/bin/env bash
curl -s https://raw.githubusercontent.com/GitAlias/gitalias/main/gitalias.txt -o ~/.gitalias
git config --global include.path ~/.gitalias
