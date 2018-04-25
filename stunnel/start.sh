#!/bin/bash
if [ ! -f /.pw_set ]; then
	/setup.sh
fi
exec /usr/sbin/sshd -D
