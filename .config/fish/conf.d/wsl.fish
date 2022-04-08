function fix_wsl2_interop
    for i in (pstree -np -s $fish_pid | grep -o -E '[0-9]+')
        if test -e "/run/WSL/"$i"_interop"
            set -x WSL_INTEROP "/run/WSL/"$i"_interop"
        end
    end
end

fix_wsl2_interop
