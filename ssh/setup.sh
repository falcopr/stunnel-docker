#!/bin/bash

if [ -f /.pw_set ]; then
    echo "Docker password already set!"
	#echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
#echo "=> Setting a ${_word} password to the root user"
#echo "root:$PASS" | chpasswd
echo "=> Setting a ${_word} password to the docker user"
echo "docker:$PASS" | chpasswd

echo "=> Done!"
touch /.pw_set

echo "========================================================================"
echo "You can now connect to this Debian container via SSH using:"
echo ""
#echo "    ssh -p <port> root@<host>"
echo "    ssh -p <port> docker@<host>"
echo ""
#echo "and enter the root password '$PASS' when prompted"
echo "and enter the docker password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
