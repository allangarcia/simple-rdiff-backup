#!/bin/bash
#
# Local sync of simple rdiff-backup script by Allan Garcia
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

if [[ $# -ne 2 ]]; then
    echo "$0: Insuficient number of arguments."
    echo "Usage: $0 <source path> <destination path>"
    exit 1
fi

SRCPATH=$1
BKPPATH=$2

OPTIONS="--backup-mode --verbosity 5 --print-statistics"

rdiff-backup $OPTIONS $SRCPATH $BKPPATH

