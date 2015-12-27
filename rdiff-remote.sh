#!/bin/bash
#
# Remote sync of simple rdiff-backup script by Allan Garcia
#
# This script is part of the backup strategy for the LAIS Research Lab
# in 2015 for its servers, databases, using 3-2-1 backup rule.
#
# Copyright (C) 2015. Allan Garcia <allan.garcia@gmail.com>.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

if [[ $# -ne 3 ]]; then
    echo "$0: Insuficient number of arguments."
    echo "Usage: $0 <host> <addr> <port>"
    exit 1
fi

HOST=$1
SSHHOST=$2
SSHPORT=$3
SSHUSER="root"

SRCPATH="/"
EXCLIST="/tmp /dev /proc /sys"
BKPPATH="/mnt/backups/${HOST}/"

COMMAND="/usr/bin/rdiff-backup"
OPTIONS="--backup-mode --verbosity 5 --remote-schema \"/usr/bin/ssh -C -p $SSHPORT %s 'sudo -S rdiff-backup --server'\" --print-statistics"
for PATH in $EXCLIST; do
    OPTIONS="$OPTIONS --exclude $PATH"
done

/bin/bash -c "$COMMAND $OPTIONS $SSHUSER@$SSHHOST::$SRCPATH $BKPPATH"
