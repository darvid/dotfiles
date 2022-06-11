. ~/.config/fish/aliases.fish

fish_ssh_agent
set -gx fish_greeting

if status is-interactive
    and not set -q TMUX
    exec tmux
end

if not type -q fisher
    curl -sL https://git.io/fisher | source
    fisher install jorgebucaran/fisher
end

# direnv (brew)
direnv hook fish | source

# pyenv (brew)
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

set -gx EDITOR code

set -U tide_jobs_icon ⚙️
set -U tide_kubectl_icon 🚢
set -U tide_os_icon 🚀
set -U tide_pwd_icon 📂
set -U tide_pwd_icon_home 🏠
set -U tide_status_bg_color brblack
set -U tide_status_icon_failure 💀
set -U tide_virtual_env_icon 🐍

function fish_title
    if [ fish != $_ ]
        tmux rename-window "$_"
    else
        tmux_directory_title
    end
end

function tmux_directory_title
    set -f max_path_length 19
    if [ "$PWD" != "$LPWD" ]
        set LPWD "$PWD"
        set -f pwd (basename (dirname "$PWD"))/(basename "$PWD")
        set -f substring (eval echo $pwd | awk (string join '' '{ print substr( $0, length($0) - ' $max_path_length ', length($0) ) }'))
        if [ (string length $pwd) -gt $max_path_length ]
            set -f prefix ".."
        end
        set -f substring (string replace (string trim -l -c / $HOME) "~" "$substring")
        tmux rename-window "$prefix$substring"
    end
end
