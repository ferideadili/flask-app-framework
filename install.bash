#! /usr/bin/env bash
# check python version, should be over 2.7
ret=`python -c 'import sys; print("%i" % (sys.hexversion<0x02060000))'`
