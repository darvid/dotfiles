# http://lewandowski.io/2016/10/fish-env/
function posix-source
    for i in (grep -v ^# $argv)
        set arr (echo $i | tr = \n)
        set -gx $arr[1] $arr[2]
    end
end
