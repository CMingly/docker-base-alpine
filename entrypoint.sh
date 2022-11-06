#!/bin/sh

find ${C_CUSTOMSCRIPTS_PATH} -type f -print0 | sort -zn | xargs -0 -I '{}' /bin/sh '{}'

tail -f /dev/null
