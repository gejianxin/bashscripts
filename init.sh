#!/bin/bash

####################################################################
########### This file provide system initialization for Ubuntu users. ###########
####################################################################

# Get sudo password for further uses.
read -p "Please type in your password and enter: " PASS

# This pipe operation may cut off the prefix of the version name, only leave the version name alone.
VERSION=`lsb_release -cs`

# Replace official update source with aliyun
echo $PASS | sudo -S sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list

# Add docker repository
# Remove previous version of docker
sudo apt remove docker docker-engine docker.io containerd runc containerd.io docker-ce docker-ce-cli
sudo rm -rf /var/lib/docker
# Add docker prerequisite packages which let apt use packages over HTTPS
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# Then add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $VERSION stable"
# Add an entry for R
sudo echo "deb https://cloud.r-project.org/bin/linux/ubuntu $VERSION-cran35/" >> /etc/apt/sources.list
# Add an entry for vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
# Add an entry for Node Source
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
sudo echo "deb https://mirrors.ustc.edu.cn/nodesource/deb/node_12.x $VERSION main" >> /etc/apt/sources.list
sudo echo "# deb-src https://mirrors.ustc.edu.cn/nodesource/deb/node_12.x $VERSION main" >> /etc/apt/sources.list
# Add an entry for olive video editor
sudo add-apt-repository ppa:olive-editor/olive-editor

sudo apt update

# Install Emacs and Vim
sudo apt install emacs vim
# Install git
sudo apt install git
# Install R
sudo apt install r-base
# Install pinyin input method
sudo apt install fcitx fcitx-googlepinyin
# Install Visual Studio Code
sudo apt install apt-transport-https
sudo apt install code
# Install NodeJS
sudo apt install nodejs
# Add current user to docker group, in order to excute docker command without sudo
sudo usermod -aG docker ${USER}
# Install docker
sudo apt install docker-ce docker-ce-cli containerd.io
# Install olive video editor
sudo apt install olive-editor
# Install OneDrive client
sudo apt install libcurl4-openssl-dev libsqlite3-dev
sudo snap install --classic dmd && sudo snap install --classic dub
git clone https://github.com/skilion/onedrive.git ~/


# OneDrive config
SYNC_DIR="~/文档/"
SYNC_LIST="文档"
mkdir -p ~/.config/onedrive
cp ./onedrive/config ~/.config/onedrive/config
sed -i "s/sync_dir.*/sync_dir\ =\ \"$SYNC_DIR\"/g" ~/.config/onedrive/config
touch ~/.config/onedrive/sync_list
echo $SYNC_LIST > ~/.config/onedrive/sync_list

if [ ! -d ~/project ]; then
   mkdir ~/project
   ln -s ~/project -t ~/文档/葛建新的工作文档
fi

# Start OneDrive service
systemctl --user enable onedrive
systemctl --user start onedrive
onedrive --resync

# TODO
# INSTALL TROJAN



####################################################################
###########                                       Setup for Emacs                                         ###########
####################################################################
EMACS_DIR=~/.emacs.d
EMACS_INIT_FILE=init.el
PACKAGE_SETUP_FILE=setup-packages.el
EMACS_CONFIG_FILE=gejianxin-linux.org
ORG2BLOG_URL_PREFIX=gejianxin
ORG_AUTHOR=葛建新
read -p "Please type in your wordpress user name and enter: " WORDPRESS_USERNAME
read -p "Please type in your wordpress password and enter: " WORDPRESS_PASSWORD

if [ ! -d $EMACS_DIR ]; then
   mkdir $EMACS_DIR
   # Initializing Emacs startup initialize file
   mv ./.emacs.d/init.el $EMACS_DIR
   sed -i "s/\$EMACS_DIR/$EMACS_DIR/g" $EMACS_DIR/$EMACS_INIT_FILE
   sed -i "s/\$PACKAGE_SETUP_FILE/$PACKAGE_SETUP_FILE/g" $EMACS_DIR/$EMACS_INIT_FILE
   sed -i "s/\$EMACS_CONFIG_FILE/$EMACS_CONFIG_FILE/g" $EMACS_DIR/$EMACS_INIT_FILE
   # Initializing Emacs package setup file
   mv ./.emacs.d/setup-packages.el $EMACS_DIR/$PACKAGE_SETUP_FILE
   sed -i "s/\$EMACS_DIR/$EMACS_DIR/g" $EMACS_DIR/$PACKAGE_SETUP_FILE
   sed -i "s/\$PACKAGE_SETUP_FILE/$PACKAGE_SETUP_FILE/g" $EMACS_DIR/$PACKAGE_SETUP_FILE
   # Initializing Emacs config file
   mv ./.emacs.d/emacs-config-file.org $EMACS_DIR/$EMACS_CONFIG_FILE
   sed -i "s/\$EMACS_DIR/$EMACS_DIR/g" $EMACS_DIR/$EMACS_CONFIG_FILE
   sed -i "s/\$ORG2BLOG_URL_PREFIX/$ORG2BLOG_URL_PREFIX/g" $EMACS_DIR/$EMACS_CONFIG_FILE
   sed -i "s/\$ORG_AUTHOR/$ORG_AUTHOR/g" $EMACS_DIR/$EMACS_CONFIG_FILE
   sed -i "s/\$WORDPRESS_USERNAME/$WORDPRESS_USERNAME/g" $EMACS_DIR/$EMACS_CONFIG_FILE
   sed -i "s/\$WORDPRESS_PASSWORD/$WORDPRESS_PASSWORD/g" $EMACS_DIR/$EMACS_CONFIG_FILE