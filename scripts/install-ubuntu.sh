#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo ':: Installing repo key'
wget http://repo.ajenti.org/debian/key -O- | apt-key add -

echo ':: Adding repo entry'
echo "deb http://repo.ajenti.org/debian main main ubuntu" > /etc/apt/sources.list.d/ajenti.list

echo ':: Installing extra repo key for ubuntu 18.04'
wget http://repo.hanada.info/universe/key -O- | apt-key add -

echo ':: Adding extra repo entry'
echo "deb http://repo.hanada.info/universe misc patch-ajenti" >> /etc/apt/sources.list.d/ajenti.list

echo ':: Updating lists'
apt-get update

echo ':: Installing package'
apt-get install -y ajenti

echo ':: Done! Open https://<address>:8000 in browser'
