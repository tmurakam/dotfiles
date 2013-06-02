#!/bin/sh
function set-proxy
{
    if [ $# -ne 0 ]; then
        export http_proxy=$1
    elif [ -e $HOME/.proxy_server ]; then
        export http_proxy=`cat $HOME/.proxy_server`
    else
        return
        #export http_proxy=http://proxygate2.nic.nec.co.jp:8080/
    fi

    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export no_proxy=.nec.co.jp,.nec.com

    # for curl
    export HTTPS_PROXY=$http_proxy
    export FTP_PROXY=$http_proxy
    export ALL_PROXY=$http_proxy
    export NO_PROXY=$no_proxy
}

function unset-proxy
{
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset no_proxy
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset ALL_PROXY
    unset NO_PROXY
}

set-proxy
