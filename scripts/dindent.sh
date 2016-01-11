#!/bin/bash

if [ "$#" -eq 0 ]; then
	find . -name '*.c' |xargs dos2unix
	find . -name '*.h' |xargs dos2unix
	find . -name '*.cpp' |xargs dos2unix

	SRCS=`find . -name "*\.[h|c|cpp]"`
	if [ -z "${SRCS// }" ]; then
		echo "No .h/.c/.cpp files here, exit."
		exit
	fi
	chmod -x $SRCS
	Lindent $SRCS

	SRCS_BK=`find . -name "*\.[h|c|cpp]~"`
	if [ -z "${SRCS_BK// }" ]; then
		echo "No Lindent backup files."
		exit
	fi
	rm -f $SRCS_BK
elif [ "$#" -eq 1 ]; then
	if [ ! -f "$1" ]; then
		echo "File \"$1\" not existed."
		exit
	fi
	dos2unix "$1"
	chmod -x "$1"
	Lindent "$1"
	rm -f "$1~"
else
	echo "Error parameters."
fi
