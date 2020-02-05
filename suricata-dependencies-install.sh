#/bin/bash

#dependencies (from suricata repo)
#system packages
sudo yum install -y epel-release
sudo yum -y install dnf-plugins-core
sudo yum config-manager --set-enabled PowerTools
sudo yum -y install \
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
