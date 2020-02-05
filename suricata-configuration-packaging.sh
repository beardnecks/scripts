#!/bin/bash

#suricata setup (configure)
cd suricata
./autogen.sh

#packaging part

#install dependencies
sudo yum -y install ruby ruby-devel ruby-libs ruby-irb gem rubygems auto-buildrequires
gem install fpm
#noen av scriptene virker det som må kjøres som root

#disse dependencies'ne ble kjørt i root deretter fungerte fpm install
yum install ruby-devel gcc make rpm-build rubygems





#install in spesific folder where we are going to build
./configure --disable-gccmarch-native --prefix=/usr --sysconfdir=/etc --localstatedir=/var
make -j2

##denne må kjøres i root (sudo su)
sudo make install-full DESTDIR=/home/suricata-build/rpm/

#!NOTE fpm kan ikke bli kjørt som root
#fpm creates rpm pkg
fpm -s dir -t rpm -n suricata-RC -v 1.000A -C /home/suricata-build/rpm/ -p suricata-1.000A_64-1.rpm usr/
