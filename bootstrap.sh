#!/bin/bash

PKG="vim-nox language-pack-en python-networkx python-numpy python-pandas"

echo "Preparing $(hostname -f)..."

# Fix sources.list
. /etc/lsb-release
sed -e "s/trusty/${DISTRIB_CODENAME}/" /vagrant/sources.list > /etc/apt/sources.list

# Install packages
apt-get clean
apt-get update
apt-get -y install $PKG
apt-get -y dist-upgrade

# Fix SSH environment stuff
sed -ibak -e 's/^AcceptEnv/#AcceptEnv/' /etc/ssh/sshd_config
service ssh restart
