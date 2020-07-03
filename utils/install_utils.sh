
#!/bin/bash

sudo apt-get --assume-yes install pyenv
sudo apt-get --assume-yes install tmux
sudo apt-get --assume-yes install xclip
sudo apt-get --assume-yes install bat
sudo apt-get --assume-yes install htop
sudo apt-get --assume-yes install ranger
sudo apt-get --assume-yes install fd-find
sudo apt-get --assume-yes install vim
sudo apt-get --assume-yes install dconf-editor
sudo apt-get --assume-yes install gnome-tweaks
sudo apt-get --assume-yes install screenruler
sudo apt-get --assume-yes install texstudio
sudo apt-get --assume-yes install synaptic
sudo snap install vlc
echo "------------------------------------------------------------------------------------------------------"

echo "development dependencies"
sudo apt-get --assume-yes install build-essential ffmpeg fluid-soundfont-gm fontconfig fonts-freefont-ttf gstreamer1.0-plugins-base gstreamer1.0-plugins-good libavcodec-dev libavformat-dev libfreetype6-dev libgstreamer1.0 libportmidi-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl1.2-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libsmpeg-dev libswscale-dev libtiff5-dev libx11-6 libx11-dev timgm6mb-soundfont xfonts-100dpi xfonts-75dpi xfonts-base xfonts-cyrillic zlib1g-dev
sudo apt-get install -f
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

echo "Dictionary"
# based on https://askubuntu.com/questions/170775/offline-dictionary-with-pronunciation-and-usages/
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get --assume-yes install dict
sudo apt-get --assume-yes install dictd
sudo apt-get --assume-yes install dict-gcide
sudo apt-get --assume-yes install dict-wn
sudo apt-get --assume-yes install dict-devil
sudo apt-get --assume-yes install dict-moby-thesaurus
sudo apt-get --assume-yes install espeak
echo "------------------------------------------------------------------------------------------------------"

echo "tldr"
sudo apt-get --assume-yes install tldr
/usr/bin/tldr --update
echo "------------------------------------------------------------------------------------------------------"

echo "Exa"
~/.cargo/bin/cargo install exa
echo "------------------------------------------------------------------------------------------------------"

echo "JetBrains"
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
echo "------------------------------------------------------------------------------------------------------"

echo "Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get --assume-yes install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get --assume-yes install sublime-text
# packages
wget -O "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package"
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
# guake preferences are loaded via dconf
echo "------------------------------------------------------------------------------------------------------"

echo "Xonsh"
sudo apt-get --assume-yes install xonsh
sudo echo $(which xonsh) >> /etc/shells
sudo chsh -s $(which xonsh) $(whoami)
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
sudo apt-get --assume-yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get --assume-yes install docker-ce docker-ce-cli containerd.io
sudo apt-get --assume-yes install docker-compose
# temporary fix for docker-compose bug
sudo python3 -m pip uninstall -y docker-py
echo "------------------------------------------------------------------------------------------------------"

echo "Howdy"
# this doesn't work well. Howdy tries to detect IR sensors on install, which requires interactive shell
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt-get update
sudo apt-get --assume-yes install howdy
sudo mkdir -p /usr/lib/security/howdy/models
sudo cp $HOME/utils/.howdy-pragy /usr/lib/security/howdy/models/pragy.dat
echo "------------------------------------------------------------------------------------------------------"

echo "Xournal++"
sudo add-apt-repository ppa:andreasbutti/xournalpp-master
sudo apt update
sudo apt-get --assume-yes install xournalpp
echo "------------------------------------------------------------------------------------------------------"

echo "Sensors"
sudo apt-get --assume-yes install lm-sensors
sudo apt-get --assume-yes install hddtemp
sudo apt-get --assume-yes install psensor
echo "------------------------------------------------------------------------------------------------------"

echo "Desktop Settings"
dconf load / < ~/.dconf-dump.ini
echo "------------------------------------------------------------------------------------------------------"

echo "Global gitignore"
git clone https://github.com/github/gitignore.git ~/.gitignore_repo
cat ~/utils/custom.gitignore ~/.gitignore_repo/Python.gitignore ~/.gitignore_repo/Java.gitignore ~/.gitignore_repo/TeX.gitignore ~/.gitignore_repo/Ruby.gitignore ~/.gitignore_repo/Rails.gitignore ~/.gitignore_repo/Global/JetBrains.gitignore ~/.gitignore_repo/Global/Linux.gitignore  ~/.gitignore_repo/Global/macOS.gitignore > ~/.gitignore_global
echo "------------------------------------------------------------------------------------------------------"

echo "Updates"
sudo apt-get update
sudo apt-get --assume-yes upgrade
echo "------------------------------------------------------------------------------------------------------"

echo "Configuring sudo"
# proceed with caution, you don't want a system with no su priviliges
echo "Defaults insults" | sudo EDITOR='tee -a' visudo
echo "------------------------------------------------------------------------------------------------------"

echo "rebooting in 10 seconds"
sleep 10
reboot
