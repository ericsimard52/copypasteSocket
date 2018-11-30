#!/bin/bash
exec {received}>/tmp/received.tmp
exec {printout}</tmp/received.tmp
nc -lp4444 >&$received &
tail -f <&$printout
