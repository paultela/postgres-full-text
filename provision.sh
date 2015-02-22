#!/bin/bash
set -e

apt-get update
apt-get dist-upgrade -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold"
apt-get autoremove -y
apt-get install -y postgresql postgresql-contrib postgresql-client
apt-get install  -y php5-cli php5-curl php5-gd php5-json php5-mcrypt php5-pgsql
apt-get install  -y git htop
[ ! -f /etc/php5/cli/conf.d/20-mcrypt.ini ] && php5enmod mcrypt
[ ! -f /usr/local/bin/composer ] && sh -c curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

[ -f /var/run/reboot-required ] && echo "Reboot required! Run 'vagrant reload' before continuing." && exit 1

exit 0
