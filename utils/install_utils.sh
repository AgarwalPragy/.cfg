#!/bin/bash

sudo apt-get --assume-yes install pyenv
sudo apt-get --assume-yes install tmux
sudo apt-get --assume-yes install xclip
sudo apt-get --assume-yes install bat
sudo apt-get --assume-yes install htop
sudo apt-get --assume-yes install ranger
sudo apt-get --assume-yes install fd-find
sudo apt-get --assume-yes install tldr
sudo apt-get --assume-yes install vim
sudo apt-get --assume-yes install dconf-editor
echo "------------------------------------------------------------------------------------------------------"

echo "JetBrains Mono"
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v1.0.6/JetBrainsMono-1.0.6.zip
unzip JetBrainsMono*.zip
sudo mv ~/JetBrainsMono*/ttf/*.ttf /usr/share/fonts/
rm -rf ~/JetBrainsMono*
fc-cache -fv 2>&1
echo "------------------------------------------------------------------------------------------------------"

echo "Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo "------------------------------------------------------------------------------------------------------"

echo "Pycharm"
sudo snap install pycharm-professional --classic
echo "------------------------------------------------------------------------------------------------------"

echo "Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get --assume-yes install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get --assume-yes install sublime-text
# packages
cd ~/.config/sublime-text-3/Installed\ Packages/
wget "https://packagecontrol.io/Package%20Control.sublime-package"
cd ~
echo "------------------------------------------------------------------------------------------------------"

echo "Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt --assume-yes install ./google-chrome*.deb
rm ./google-chrome*.deb
echo "------------------------------------------------------------------------------------------------------"

# echo "VSCode"
# sudo snap install --classic code
# cp vs_code_keybindings.json ~/.config/Code/User/keybindings.json
echo "------------------------------------------------------------------------------------------------------"

echo "locate"
sudo apt-get --assume-yes install mlocate
sudo updatedb
echo "------------------------------------------------------------------------------------------------------"

echo "Guake"
sudo apt-get --assume-yes install guake
mkdir ~/.config/autostart
cp /usr/share/applications/guake.desktop ~/.config/autostart/
echo "X-GNOME-Autostart-enabled=true" >> ~/.config/autostart/guake.desktop
dconf write /apps/guake/style/font/style "'JetBrains Mono Bold 12'"
dconf write /apps/guake/style/background/transparency 100
dconf write /apps/guake/general/use-default-font false
echo "------------------------------------------------------------------------------------------------------"

echo "Xonsh"
sudo apt-get --assume-yes install xonsh
sudo echo $(which xonsh) >> /etc/shells
sudo chsh -s $(which xonsh)
cp ~/personalize/.xonshrc ~/
sudo apt-get --assume-yes install python3-pip
xonsh -c "xpip install xonsh-apt-tabcomplete"
xonsh -c "xpip install xonsh-docker-tabcomplete"
xonsh -c "xpip install xontrib-powerline2"
xonsh -c "xpip install xontrib-readable-traceback"
xonsh -c "xpip install xontrib-pyenv"
echo "------------------------------------------------------------------------------------------------------"

echo "Docker"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get --assume-yes install docker-ce docker-ce-cli containerd.io
sudo apt-get --assume-yes install docker-compose
# temporary fix for docker-compose bug
sudo python3 -m pip uninstall -y docker-py
echo "------------------------------------------------------------------------------------------------------"

echo "Desktop Settings"
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 13'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
echo "------------------------------------------------------------------------------------------------------"

echo "going to restart"
read
echo "rebooting in 10 seconds"
sleep 10
reboot
