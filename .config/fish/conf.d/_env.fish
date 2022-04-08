if status is-login
    fish_add_path -g ~/.local/bin
    fish_add_path -g ~/bin

    set -gx LC_ALL en_US.UTF-8
    set -gx LANG en_US.UTF-8

    set -gx AWS_VAULT_BACKEND pass
    set -gx GPG_TTY (tty)
end
