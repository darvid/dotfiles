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

set -gx EDITOR code-insiders

set -U tide_asdf_nodejs_bg_color normal
set -U tide_asdf_nodejs_icon 📦
set -U tide_asdf_python_bg_color normal
set -U tide_asdf_python_icon 🐍
set -U tide_character_icon 💲
set -U tide_cmd_duration_icon ⏱️
set -U tide_git_icon 🐙
set -U tide_jobs_icon ⚙️
set -U tide_kubectl_icon 🚢
set -U tide_os_icon 🚀
set -U tide_pwd_color_dirs 7f849c
set -U tide_pwd_color_truncated_dirs 6c7086
set -U tide_pwd_icon 📂
set -U tide_pwd_icon_home 🏠
set -U tide_status_bg_color brblack
set -U tide_status_icon_failure 💀
set -U tide_virtual_env_icon 🐍

set -U tide_right_prompt_items asdf_python asdf_nodejs status cmd_duration context jobs virtual_env rustc go kubectl toolbox terraform time

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
zoxide init fish | source

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

# pnpm
set -gx PNPM_HOME "/home/david/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# https://github.com/docker/for-win/issues/12355
sed -id '/credsStore/d' ~/.docker/config.json

set -Ux AWS_VAULT_BACKEND pass
