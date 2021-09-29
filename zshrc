[[ -z "$TMUX" ]] && tmux

grep -Eqi "(Microsoft|WSL)" /proc/version
IS_WSL=$?

keychain --nogui -q $HOME/.ssh/id_ed25519
source $HOME/.keychain/$HOST-sh

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  git clone https://github.com/zdharma/zinit.git ~/.zinit
fi

source ~/.zinit/bin/zinit.zsh

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.serverless/bin:$PATH"
# export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize
export GOPATH="$HOME/go"
export PATH="$GOPATH:$PATH"

zinit light zinit-zsh/z-a-bin-gem-node

# GEOMETRY_COLOR_DIR=152
# GEOMETRY_STATUS_SYMBOL="異"
# GEOMETRY_STATUS_SYMBOL_ERROR="ﮊ"

# https://github.com/geometry-zsh/geometry/pull/304
# zinit ice wait"0" lucid ver"168f026" atload"geometry::prompt"
# zinit light geometry-zsh/geometry
# zinit light jamescostian/geometry

zinit ice from"gh-r" as"program" atload'eval "$(starship init zsh)"'
zinit load starship/starship

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555,underline"
ZSH_AUTOSUGGEST_USE_ASYNC=1

zinit load agkozak/zsh-z

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit ice lucid wait'1'
zinit light Aloxaf/fzf-tab

zinit ice from"gh-r" as"program"
zinit load open-pomodoro/openpomodoro-cli

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::helm
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

zinit ice from"gh-r" as"program" mv"minikube* -> minikube" bpick"*linux*"
zinit load kubernetes/minikube

zinit pick"misc/quitcd/quitcd.zsh" sbin make light-mode for jarun/nnn

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

zinit ice from"gh-r" as"program" mv"jq* -> jq"
zinit light stedolan/jq

zinit ice from"gh-r" as"program" mv"multiwerf* -> multiwerf"
zinit light werf/multiwerf
. $(multiwerf use 1.1 stable --as-file)

zinit ice atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
    atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zinit light pyenv/pyenv

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/david/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/david/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/david/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/david/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# disable init of env "base"
conda config --set auto_activate_base false

zinit ice wait"2" lucid
zinit load voronkovich/gitignore.plugin.zsh

AWS_VAULT_PL_CHAR=☁️
zinit ice wait"2" lucid atload"GEOMETRY_RPROMPT+=(prompt_aws_vault_segment)"
zinit load blimmer/zsh-aws-vault

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

zinit wait lucid for dim-an/cod

if ! command -v jsonnetfmt &> /dev/null; then
  go get github.com/google/go-jsonnet/cmd/jsonnetfmt
fi

bindkey -v
bindkey "^[[A"    history-beginning-search-backward
bindkey "^[[B"    history-beginning-search-forward
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[3~"   delete-char
bindkey "^A"      beginning-of-line
bindkey "^E"      end-of-line

alias ls="exa -bh --icons --color=auto"
alias grep="command grep --colour=auto --binary-files=without-match --directories=skip"

if [[ $IS_WSL -eq 0 ]] && ! update-alternatives --query explorer >/dev/null 2>&1; then
  sudo update-alternatives --install "$HOME/bin/explorer" "explorer" "$(which explorer.exe)" 1
fi

fpath+=( $HOME/functions )
autoload -Uz $HOME/functions/*(.:t)

source $HOME/.zsh_aliases
source $HOME/.zsh_exports

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
