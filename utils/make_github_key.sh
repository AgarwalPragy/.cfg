# !/usr/bin/bash
echo
read -p "Create a new key for github?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	mkdir -pv ~/.ssh/
	rm ~/.ssh/github
	ssh-keygen -t "rsa" -b 4096 -C "agar.pragy@gmail.com" -f ~/.ssh/github -q -N ""
	eval "$(ssh-agent -s)"
	ssh-add -q ~/.ssh/github
	cat ~/.ssh/github.pub | xclip -selection c
	killall -9 xclip
	echo
	echo "Github Public key copied to clipboard. Add it to your github account"
	echo "Remember to use ssh instead of https in git repos"
	google-chrome "https://github.com/settings/keys" &>/dev/null &
	read -p "Press enter to continue" -n 1 -r
fi
