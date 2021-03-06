#!/bin/bash

echo "apt-fast"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install apt-fast
sudo cp ~/utils/apt-fast.conf /etc/
echo "------------------------------------------------------------------------------------------------------"

echo "yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt-fast -y install yarn
echo "------------------------------------------------------------------------------------------------------"

sudo apt-fast -y install pyenv
# sudo apt-fast -y install tmux
# sudo apt-fast -y install i3
sudo apt-fast -y install xclip
sudo apt-fast -y install bat
sudo apt-fast -y install xdotool
sudo apt-fast -y install htop
# sudo apt-fast -y install ranger
sudo apt-fast -y install fd-find
sudo apt-fast -y install vim
sudo apt-fast -y install dconf-editor
sudo apt-fast -y install gnome-tweaks
sudo apt-fast -y install screenruler
sudo apt-fast -y install texstudio texlive texlive-xetex texlive-font-utils texlive-fonts-extra texlive-extra-utils texlive-science texlive-pictures texlive-publishers texlive-formats-extra
sudo apt-fast -y install synaptic
sudo apt-fast -y install net-tools
sudo apt-fast -y install guake
sudo apt-fast -y install ruby-github-linguist
sudo apt-fast -y install pm-utils
sudo apt-fast -y install gparted
sudo apt-fast -y install postgresql postgresql-contrib

sudo snap install vlc
sudo snap install discord --classic
sudo snap install slack --classic
sudo snap install pdftk
echo "------------------------------------------------------------------------------------------------------"

echo "development dependencies"
sudo apt-fast -y install build-essential ffmpeg fluid-soundfont-gm fontconfig fonts-freefont-ttf gstreamer1.0-plugins-base gstreamer1.0-plugins-good libavcodec-dev libavformat-dev libfreetype6-dev libgstreamer1.0 libportmidi-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl1.2-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libsmpeg-dev libswscale-dev libtiff5-dev libx11-6 libx11-dev timgm6mb-soundfont xfonts-100dpi xfonts-75dpi xfonts-base xfonts-cyrillic zlib1g-dev
sudo apt-get install -f
echo "------------------------------------------------------------------------------------------------------"

echo "Python"
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-fast update
sudo apt-fast -y install python2.7 python2.7-dev
sudo apt-fast -y install python3.5 python3.5-dev
sudo apt-fast -y install python3.6 python3.6-dev
sudo apt-fast -y install python3.7 python3.7-dev
sudo apt-fast -y install python3.8 python3.8-dev
sudo apt-fast -y install python3.9 python3.9-dev
echo "------------------------------------------------------------------------------------------------------"


echo "PGAdmin"
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list
apt update
sudo apt-fast -y install pgadmin4
echo "------------------------------------------------------------------------------------------------------"

echo "Java"
sudo apt-fast -y install default-jdk default-jre
echo "------------------------------------------------------------------------------------------------------"

echo "uget"
sudo add-apt-repository ppa:plushuang-tw/uget-stable
sudo apt-fast update
sudo apt-fast -y install uget aria2
echo "------------------------------------------------------------------------------------------------------"

echo "JetBrains Mono"
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.210/JetBrainsMono-2.210.zip
unzip -q JetBrains*Mono*.zip
sudo mv ~/fonts/ttf/*.ttf /usr/share/fonts/
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
~/.cargo/bin/cargo install miniserve
~/.cargo/bin/rustup toolchain install nightly
~/.cargo/bin/rustup default nightly
echo "------------------------------------------------------------------------------------------------------"

echo "Node, NPM"
sudo apt-fast -y install nodejs
sudo apt-fast -y install npm
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

# echo "Dictionary"
# # based on https://askubuntu.com/questions/170775/offline-dictionary-with-pronunciation-and-usages/
# sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
# sudo apt-fast -y install dict
# sudo apt-fast -y install dictd
# sudo apt-fast -y install dict-gcide
# sudo apt-fast -y install dict-wn
# sudo apt-fast -y install dict-devil
# sudo apt-fast -y install dict-moby-thesaurus
# sudo apt-fast -y install espeak
# echo "------------------------------------------------------------------------------------------------------"

echo "tldr"
sudo apt-fast -y install tldr
/usr/bin/tldr --update
echo "------------------------------------------------------------------------------------------------------"

echo "Dust"
~/.cargo/bin/cargo install du-dust
echo "------------------------------------------------------------------------------------------------------"

echo "Exa"
~/.cargo/bin/cargo install exa
echo "------------------------------------------------------------------------------------------------------"

echo "JetBrains"
sudo snap install pycharm-professional --classic
# sudo snap install clion --classic
sudo snap install intellij-idea-ultimate --classic
# sudo snap install android-studio --classic
echo "------------------------------------------------------------------------------------------------------"

# echo "Flutter"
# sudo snap install flutter --classic
# sudo snap install flutter-gallery
# flutter channel dev
# flutter upgrade
# flutter config --enable-linux-desktop
# echo "------------------------------------------------------------------------------------------------------"

echo "Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-fast -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-fast update
sudo apt-fast -y install sublime-text
# packages
wget -O "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package"
echo "------------------------------------------------------------------------------------------------------"

echo "Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome*.deb
rm ./google-chrome*.deb
echo "------------------------------------------------------------------------------------------------------"

echo "Heroku CLI"
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
echo "------------------------------------------------------------------------------------------------------"

# echo "VSCode"
# sudo snap install --classic code
# cp vs_code_keybindings.json ~/.config/Code/User/keybindings.json
# echo "------------------------------------------------------------------------------------------------------"

echo "locate"
sudo apt-fast -y install mlocate
sudo updatedb
echo "------------------------------------------------------------------------------------------------------"

echo "Xonsh"
sudo apt-fast -y install xonsh
sudo echo $(which xonsh) >> /etc/shells
sudo chsh -s $(which xonsh) $(whoami)
sudo apt-fast -y install python3-pip
xonsh -c "xpip install xonsh-apt-tabcomplete"
xonsh -c "xpip install xonsh-docker-tabcomplete"
sudo apt-fast -y install python3-packaging  # needed for powerline2
xonsh -c "xpip install xontrib-powerline2"
xonsh -c "xpip install xontrib-readable-traceback"
xonsh -c "xpip install xontrib-pyenv"
echo "------------------------------------------------------------------------------------------------------"

# echo "Howdy"
# # this doesn't work well. Howdy tries to detect IR sensors on install, which requires interactive shell
# sudo add-apt-repository ppa:boltgolt/howdy
# sudo apt-fast update
# sudo apt-fast -y install howdy
# sudo mkdir -p /usr/lib/security/howdy/models
# sudo cp $HOME/utils/.howdy-pragy /usr/lib/security/howdy/models/pragy.dat
# echo "------------------------------------------------------------------------------------------------------"

# echo "Xournal++"
# sudo add-apt-repository ppa:andreasbutti/xournalpp-master
# sudo apt update
# sudo apt-fast -y install xournalpp
# echo "------------------------------------------------------------------------------------------------------"

echo "zoom.us"
wget -O Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt update
sudo apt install ~/Downloads/zoom.deb
rm -f ~/Downloads/zoom.deb
echo "------------------------------------------------------------------------------------------------------"

echo "Sensors"
sudo apt-fast -y install lm-sensors
sudo apt-fast -y install hddtemp
sudo apt-fast -y install psensor
echo "------------------------------------------------------------------------------------------------------"

echo "UNetbootin"
sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install unetbootin
echo "------------------------------------------------------------------------------------------------------"

echo "Docker"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-fast -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-fast update
sudo apt-fast -y install docker-ce docker-ce-cli containerd.io
sudo apt-fast -y install docker-compose
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

echo "AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
echo "------------------------------------------------------------------------------------------------------"

echo "AWS Vault"
sudo curl -L -o /usr/local/bin/aws-vault https://github.com/99designs/aws-vault/releases/latest/download/aws-vault-linux-amd64
sudo chmod 755 /usr/local/bin/aws-vault
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
