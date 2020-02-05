#/bin/bash

sudo yum update -y

#docker setup (uncomment when needed)
#sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
#sudo dnf -y  install docker-ce --nobest

#sudo systemctl enable -now docker

#git repo setup
sudo yum install git -y
git clone https://github.com/OISF/suricata.git
cd suricata/
git clone https://github.com/OISF/libhtp.git

#depenencies (joachim versjon)
sudo yum install -y epel-release
sudo yum config-manager --set-enabled PowerTools
sudo yum -y install gcc libpcap-devel pcre-devel libyaml-devel file-devel \
zlib-devel jansson-devel nss-devel libcap-ng-devel libnet-devel tar make \
libnetfilter_queue-devel lua-devel libmaxminddb-devel rustc cargo lz4-devel \
python3 python3-pyyaml libtool gcc-c++

cargo install --force cbindgen

#add to path
#export PATH=$PATH:/home/centos/.cargo/bin

#v2
echo PATH=$PATH:/home/centos/.cargo/bin >> /home/centos/.bashrc
source /home/centos/.bashrc

##end

#dependencies (from suricata repo)
#system packages
yum -y install dnf-plugins-core
yum config-manager --set-enabled PowerTools
yum -y install \
    autoconf \
    automake \
    cargo-vendor \
    diffutils \
    file-devel \
    gcc \
    gcc-c++ \
    git \
    jansson-devel \
    jq \
    lua-devel \
    libtool \
    libyaml-devel \
    libnfnetlink-devel \
    libnetfilter_queue-devel \
    libnet-devel \
    libcap-ng-devel \
    libevent-devel \
    libmaxminddb-devel \
    libpcap-devel \
    libtool \
    lz4-devel \
    make \
    nss-devel \
    pcre-devel \
    pkgconfig \
    python3-devel \
    python3-sphinx \
    python3-yaml \
    rust-toolset \
    sudo \
    which \
    zlib-devel

#install cbindgen
cargo install --force cbindgen
#add to path
echo PATH=$PATH:/home/centos/.cargo/bin >> /home/centos/.bashrc
source /home/centos/.bashrc

##end            

#add to path
#export PATH=$PATH:/home/centos/.cargo/bin

#v2
echo PATH=$PATH:/home/centos/.cargo/bin >> /home/centos/.bashrc
source /home/centos/.bashrc


#suricata setup (configure)
cd
cd suricata
./autogen.sh


#packaging part

#install dependencies
sudo yum -y install ruby ruby-devel ruby-libs ruby-irb gem rubygems auto-buildrequires
sudo gem install fpm



#install in spesific folder where we are going to build
./configure --disable-gccmarch-native --prefix=/usr --sysconfdir=/etc --localstatedir=/var 
make -j4
sudo make install-full DESTDIR=/home/suricata-build/rpm/

#fpm creates rpm pkg
fpm -s dir -t rpm -n suricata-RC -v 1.000A -C /home /suricata-build/rpm/ -p suricata-1.000A_64-1.rpm usr/



