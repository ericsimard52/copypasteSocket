#!/bin/bash
bufferFile=/tmp/send.tmp
exec {dest}>/dev/tcp/192.168.0.11/4444
if [ -f $bufferFile ]; then
    rm $bufferFile
fi
touch $bufferFile
exec {content}<$bufferFile
<&$content tail -f >&$dest &
emacsclient $bufferFile&
