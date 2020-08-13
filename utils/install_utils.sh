#!/bin/bash

echo "apt-fast"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install apt-fast
sudo cp ~/utils/apt-fast.conf /etc/
echo "------------------------------------------------------------------------------------------------------"

alias APT=sudo apt-fast -y install
alias SNAP=sudo snap --color install
echo "------------------------------------------------------------------------------------------------------"

echo "yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
APT yarn
echo "------------------------------------------------------------------------------------------------------"

APT pyenv
APT tmux
APT xclip
APT bat
APT htop
APT ranger
APT fd-find
APT vim
APT dconf-editor
APT gnome-tweaks
APT screenruler
APT texstudio
APT synaptic
APT net-tools
APT guake
APT ruby-github-linguist
APT pm-utils
APT postgresql postgresql-contrib
SNAP vlc
SNAP discord --classic
echo "------------------------------------------------------------------------------------------------------"

echo "development dependencies"
APT build-essential ffmpeg fluid-soundfont-gm fontconfig fonts-freefont-ttf gstreamer1.0-plugins-base gstreamer1.0-plugins-good libavcodec-dev libavformat-dev libfreetype6-dev libgstreamer1.0 libportmidi-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl1.2-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libsmpeg-dev libswscale-dev libtiff5-dev libx11-6 libx11-dev timgm6mb-soundfont xfonts-100dpi xfonts-75dpi xfonts-base xfonts-cyrillic zlib1g-dev
sudo apt-get install -f
echo "------------------------------------------------------------------------------------------------------"

echo "uget"
sudo add-apt-repository ppa:plushuang-tw/uget-stable
sudo apt-fast update
APT uget aria2
echo "------------------------------------------------------------------------------------------------------"

echo "JetBrains Mono"
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.001/JetBrains.Mono.2.001.zip
unzip -q JetBrains*Mono*.zip
sudo mv ~/JetBrains*Mono*/ttf/*.ttf /usr/share/fonts/
rm -rf ~/JetBrains*Mono*
fc-cache -fv 2>&1
echo "------------------------------------------------------------------------------------------------------"

echo "Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
~/.cargo/bin/cargo install cargo-watch
~/.cargo/bin/cargo install cargo-edit
~/.cargo/bin/cargo install cargo-update
~/.cargo/bin/cargo install cargo-deb
~/.cargo/bin/cargo install cargo-web
~/.cargo/bin/cargo install cargo-expand
~/.cargo/bin/cargo install cargo-release
~/.cargo/bin/cargo install cargo-tree
~/.cargo/bin/rustup toolchain install nightly
~/.cargo/bin/rustup default stable
# currently not available in stable channel
# ~/.cargo/bin/cargo install miniserve
echo "------------------------------------------------------------------------------------------------------"

echo "Node, NPM"
APT nodejs
APT npm
sudo /usr/local/bin/npm install npm@latest -g
sudo npm install --global rollup
sudo npm install --global webpack webpack-cli
echo "------------------------------------------------------------------------------------------------------"

echo "Svelte"
sudo npm install --global svelte rollup-plugin-svelte
echo "------------------------------------------------------------------------------------------------------"

# https://rustwasm.github.io/docs/book/game-of-life/setup.html
echo "Rust wasm toolchain"
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
~/.cargo/bin/cargo install cargo-generate
# https://yew.rs/docs/getting-started/project-setup/using-wasm-pack
sudo npm install @wasm-tool/wasm-pack-plugin
echo "------------------------------------------------------------------------------------------------------"

echo "Dictionary"
# based on https://askubuntu.com/questions/170775/offline-dictionary-with-pronunciation-and-usages/
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
APT dict
APT dictd
APT dict-gcide
APT dict-wn
APT dict-devil
APT dict-moby-thesaurus
APT espeak
echo "------------------------------------------------------------------------------------------------------"

echo "tldr"
APT tldr
/usr/bin/tldr --update
echo "------------------------------------------------------------------------------------------------------"

echo "Dust"
~/.cargo/bin/cargo install du-dust
echo "------------------------------------------------------------------------------------------------------"

echo "Exa"
~/.cargo/bin/cargo install exa
echo "------------------------------------------------------------------------------------------------------"

echo "JetBrains"
SNAP pycharm-professional --classic
SNAP clion --classic
SNAP intellij-idea-ultimate --classic
echo "------------------------------------------------------------------------------------------------------"

echo "Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
APT apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-fast update
APT sublime-text
# packages
wget -O "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package"
echo "------------------------------------------------------------------------------------------------------"

echo "Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome*.deb
rm ./google-chrome*.deb
echo "------------------------------------------------------------------------------------------------------"

# echo "VSCode"
# SNAP --classic code
# cp vs_code_keybindings.json ~/.config/Code/User/keybindings.json
# echo "------------------------------------------------------------------------------------------------------"

echo "locate"
APT mlocate
sudo updatedb
echo "------------------------------------------------------------------------------------------------------"

echo "Xonsh"
APT xonsh
sudo echo $(which xonsh) >> /etc/shells
sudo chsh -s $(which xonsh) $(whoami)
APT python3-pip
xonsh -c "xpip install xonsh-apt-tabcomplete"
xonsh -c "xpip install xonsh-docker-tabcomplete"
xonsh -c "xpip install xontrib-powerline2"
xonsh -c "xpip install xontrib-readable-traceback"
xonsh -c "xpip install xontrib-pyenv"
echo "------------------------------------------------------------------------------------------------------"

echo "Docker"
sudo apt-get remove docker docker-engine docker.io containerd runc
APT apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-fast update
APT docker-ce docker-ce-cli containerd.io
APT docker-compose
# temporary fix for docker-compose bug
sudo python3 -m pip uninstall -y docker-py
# https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
rm -rf ~/.docker/
sudo systemctl enable docker
sudo service docker restart
echo "------------------------------------------------------------------------------------------------------"

echo "Howdy"
# this doesn't work well. Howdy tries to detect IR sensors on install, which requires interactive shell
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt-fast update
APT howdy
sudo mkdir -p /usr/lib/security/howdy/models
sudo cp $HOME/utils/.howdy-pragy /usr/lib/security/howdy/models/pragy.dat
echo "------------------------------------------------------------------------------------------------------"

echo "Xournal++"
sudo add-apt-repository ppa:andreasbutti/xournalpp-master
sudo apt update
APT xournalpp
echo "------------------------------------------------------------------------------------------------------"

echo "zoom.us"
wget -O Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt update
sudo apt install ~/Downloads/zoom.deb
rm -f ~/Downloads/zoom.deb
echo "------------------------------------------------------------------------------------------------------"

echo "Sensors"
APT lm-sensors
APT hddtemp
APT psensor
echo "------------------------------------------------------------------------------------------------------"

echo "Desktop Settings"
dconf load / < ~/.dconf-dump.ini
echo "------------------------------------------------------------------------------------------------------"

echo "Global gitignore"
git clone https://github.com/github/gitignore.git ~/.gitignore_repo
cat ~/utils/custom.gitignore ~/.gitignore_repo/Python.gitignore ~/.gitignore_repo/Java.gitignore ~/.gitignore_repo/TeX.gitignore ~/.gitignore_repo/Ruby.gitignore ~/.gitignore_repo/Rails.gitignore ~/.gitignore_repo/Global/JetBrains.gitignore ~/.gitignore_repo/Global/Linux.gitignore  ~/.gitignore_repo/Global/macOS.gitignore > ~/.gitignore_global
echo "------------------------------------------------------------------------------------------------------"

echo "Updates"
sudo apt-fast update
sudo apt-get -y upgrade
echo "------------------------------------------------------------------------------------------------------"

echo "Configuring sudo"
# proceed with caution, you don't want a system with no su priviliges
echo "Defaults insults" | sudo EDITOR='tee -a' visudo
echo "------------------------------------------------------------------------------------------------------"

echo "rebooting in 10 seconds"
sleep 10
reboot
