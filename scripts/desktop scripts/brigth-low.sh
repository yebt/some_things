#!/bin/bash

BRACT=$(pkexec xfpm-power-backlight-helper --get-brightness)

case $1 in
	up)
		pkexec xfpm-power-backlight-helper --set-brightness $((BRACT + 10))
		;;
	down)	
		pkexec xfpm-power-backlight-helper --set-brightness $((BRACT - 10))
		;;
	*)
		;;
esac
