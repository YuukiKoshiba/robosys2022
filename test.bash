#!/bin/bash
# SPDX-FileCopyrightText: 2022 Yuuki Koshiba
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo NG at line $1
	res=1
}

res=0

### I/O TEST ###
out=$(seq 5 | ./multiplication)
[ "${out}" = 120 ] || ng $LINENO

### STRANGE INPUT ###
out=$(echo あ | ./multiplication)
[ "$?" = 1 ] 	  || ng $LINENO
[ "${out}" = "" ] || ng $LINENO

out=$(echo | ./multiplication)
[ "$?" = 1 ] 	  || ng $LINENO
[ "${out}" = "" ] || ng $LINENO


[ "$res"  = 0 ] && echo OK
exit $res
