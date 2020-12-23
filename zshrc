[[ -z "$TMUX" ]] && tmux

keychain --nogui -q $HOME/.ssh/id_ed25519
source $HOME/.keychain/$HOST-sh

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  git clone https://github.com/zdharma/zinit.git ~/.zinit
fi

source ~/.zinit/bin/zinit.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

zinit light zinit-zsh/z-a-bin-gem-node

GEOMETRY_COLOR_DIR=152

# https://github.com/geometry-zsh/geometry/pull/304
zinit ice wait"0" lucid ver"168f026" atload"geometry::prompt"
# zinit light geometry-zsh/geometry
zinit light jamescostian/geometry

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555,underline"
ZSH_AUTOSUGGEST_USE_ASYNC=1

zinit load agkozak/zsh-z

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit ice lucid wait'1'
zinit light Aloxaf/fzf-tab

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::termsupport.zsh

export LESSCHARSET=utf-8
export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
zinit light lukechilds/zsh-nvm

zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

zinit ice as"command" from"gh-r" pick"fpp"
zinit light facebook/pathpicker

zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose

zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa" bpick"*linux*"
zinit light ogham/exa

zinit pick"misc/quitcd/quitcd.zsh" sbin make light-mode for jarun/nnn

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

zinit ice from"gh-r" as"program" mv"direnv* -> direnv"
zinit light direnv/direnv

zinit ice atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
    atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zinit light pyenv/pyenv

zinit ice wait"2" lucid
zinit load voronkovich/gitignore.plugin.zsh

zinit ice as"program" pick"bin/git-dsf"
zinit light zdharma/zsh-diff-so-fancy

zinit ice wait"2" lucid as'command' pick'src/vramsteg' \
    atclone'cmake .' atpull'%atclone' make  # use Turbo mode
zinit light psprint/vramsteg-zsh

autoload up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

zinit ice lucid wait'0a' as'completion' blockf has'tmux' pick'completion/zsh'
zinit light greymd/tmux-xpanes

zinit ice lucid wait'0a' as'completion' blockf has'cargo'
zinit snippet https://raw.githubusercontent.com/rust-lang/cargo/master/src/etc/_cargo

zinit ice lucid wait'0a' as'completion' blockf has'rustc'
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/rust/_rust

zinit ice lucid wait'0a' as'completion' blockf has'docker'
zinit snippet https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

zinit ice lucid wait'0a' as'completion' blockf has'fd'
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/fd/_fd

zinit ice lucid wait'0a' as'completion' blockf has'exa' mv'completions.zsh -> _exa'
zinit snippet https://raw.githubusercontent.com/ogham/exa/master/completions/completions.zsh

zinit light MichaelAquilina/zsh-autoswitch-virtualenv

zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

bindkey -v
bindkey "^[[A"    history-beginning-search-backward
bindkey "^[[B"    history-beginning-search-forward
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[3~"   delete-char

alias ls="exa -bh --icons --color=auto"
alias grep="command grep --colour=auto --binary-files=without-match --directories=skip"

source $HOME/.zsh_aliases
source $HOME/.zsh_exports
