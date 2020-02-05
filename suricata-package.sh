#/bin/bash

#install dependencies
sudo yum -y install gcc make git ruby ruby-devel ruby-libs ruby-irb rubygems auto-buildrequires
sudo gem install fpm

#get source (if you dont have it already)


#install in spesific folder where we are going to build
sudo ./configure --disable-gccmarch-native --prefix=/usr --sysconfdir=/etc --localstatedir=/var && sudo make && sudo make install-full DESTDIR=/home/suricata-build/rpm/

#fpm creates rpm pkg
fpm -s dir -t rpm -n suricata-RC -v 1.000A -C /home /suricata-build/rpm/ -p suricata-1.000A_64-1.rpm usr/

