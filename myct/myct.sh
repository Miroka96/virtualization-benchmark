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
    case $2 in
        --namespace | -n)   echo "namespaces"
                            ;;
        * )                 run_new_name $1 "${@:3}"
                            ;;
    esac
}

run_new_name () {
    mount -t proc proc $1/proc
    unshare -p -f --mount-proc=$1/proc \
    chroot $1 "${@:2}"
}

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
