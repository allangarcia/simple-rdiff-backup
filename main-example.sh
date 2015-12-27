#!/bin/bash
#
# Main file of simple rdiff-backup script by Allan Garcia
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

# -------------------------------------------------------- #
HOST="some-postgres-host"
ADDR="10.0.0.101"
PORT="22"

# database dump
./pgdump-remote.sh ${HOST} ${ADDR} ${PORT}

# -------------------------------------------------------- #
HOST="some-mysql-host"
ADDR="10.0.0.102"
PORT="2201"
ROOT="some-fancy-mysql-root-password"

# database dump 
./mydump-remote.sh ${HOST} ${ADDR} ${PORT} ${PASS}

# -------------------------------------------------------- #
HOST="some-generic-host"
ADDR="10.0.0.103"
PORT="2202"

# filesystem sync 
./rdiff-remote.sh ${HOST} ${ADDR} ${PORT}

