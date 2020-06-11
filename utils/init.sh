sudo apt-get update
sudo apt-get --assume-yes install build-essential curl file git
git clone --bare https://github.com/AgarwalPragy/.cfg.git ~/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME reset hard
git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote set-url origin git@github.com:AgarwalPragy/.cfg.git
bash ~/utils/install_utils.sh
