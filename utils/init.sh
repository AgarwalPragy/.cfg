sudo apt-get update
sudo apt-get --assume-yes install build-essential curl file git
git clone --bare https://github.com/AgarwalPragy/.cfg.git ~/.cfg
git --git-dir=~/.cfg/ --work-tree=~/ --reset HARD
git --git-dir=~/.cfg/ --work-tree=~/ remote set-url origin git@github.com:AgarwalPragy/.cfg.git
bash ~/utils/install_utils.sh
