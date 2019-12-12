#! /bin/bash
sudo apt-get install -y software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu xenial main'
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/nginx
sudo apt-get update
sudo apt-get install -y nginx mariadb-server php7.0-fpm php7.0-cli php7.0-common php7.0-json php7.0-mysql php7.0-soap php7.0-tidy php7.0-curl php7.0-zip php7.0-xml php-xdebug

# check ufw app list and enable nginx
# $ sudo ufw allow 'Nginx HTTP'
# $ sudo ufw enable

# enable MariaDB
# $ sudo systemctl enable mariadb
# $ sudo systemctl start mariadb

# harden your mysql
# $ sudo mysql_secure_installation

# start/restart php
# $ sudo systemctl restart php7.0-fpm

# follow this right chea
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04

#mariadb ref
# https://downloads.mariadb.org/mariadb/repositories

#vagrant bento box
# $ vagrant init bento/ubuntu-16.04
# $ vagrant up
