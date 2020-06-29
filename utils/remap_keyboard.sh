#!/bin/bash
while true
do
	# clear all previous mapppings
	setxkbmap -option
	# set new mappings
	setxkbmap -option caps:backspace
	setxkbmap -option shift:both_capslock
	xmodmap -e "clear Lock"
	xset r rate 220 40
	sleep 1m
done
