#!/bin/sh
/setup.sh
exec stunnel "$@"
