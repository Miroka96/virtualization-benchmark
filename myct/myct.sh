#!/bin/bash

init () {
    echo "init"
    debootstrap stable $1 http://deb.debian.org/debian
}

map () {
    echo "map"
    echo $1$3
    mkdir -p $1$3
    mount --bind -o ro $2 $1$3
}

run () {
    echo "run"
    path=$1
    namespaces=()
    limits=()
    prog=''
    while [ "$2" != "" ] && [ "$prog" = '' ]; do
        case $2 in
            --namespace | -n)   namespaces+=($3)
                                shift
                                shift
                                ;;
            --limit | -l )      limits+=($3)
                                shift
                                shift
                                ;;
            * )                 prog="${@:2}"
                                ;;
        esac
    done
    echo ${namespaces[@]}
    echo ${limits[@]}
    echo $prog
    if [ ${#limits} != 0 ]; then
        name=${path##*/}
        for keyval in "${limits[@]}"; do
            type=${keyval%.*}
            key=${keyval%=*}
            val=${keyval##*=}
            echo $key $name $val $type
            mkdir /sys/fs/cgroup/$type/$name/ 2>/dev/null
            echo $val > /sys/fs/cgroup/$type/$name/$key
        done
        echo $$ > /sys/fs/cgroup/$type/$name/tasks
    fi
    if [ ${#namespaces} = 0 ]; then
        echo "$prog" $prog
        #mount -t proc proc $path/proc 2>/dev/null
        unshare -p -f --mount-proc=$path/proc \
        chroot $path ${prog}
    else
        arg=''
        for nskeyval in "${namespaces[@]}"; do
            nstype=${nskeyval%%=*}
            pid=${nskeyval##*=}
            arg+='--'$nstype'=/proc/'$pid'/ns/'$nstype
            echo $arg
        done
        nsenter $arg unshare -f --mount-proc=$path/proc \
        chroot $path ${prog}
    fi
    
    
        
}


echo "$$"
case $1 in 
    init )  shift
            init "$@"
            ;;
    map )   shift
            map "$@"
            ;;
    run )   shift
            run "$@"
            ;;
    * )     echo "wrong args"
            exit
esac