# Install Suricata on CentOS 8

```
sudo yum update
sudo yum install -y epel-release
sudo yum config-manager --set-enabled PowerTools
sudo yum -y install gcc libpcap-devel pcre-devel libyaml-devel file-devel \
zlib-devel jansson-devel nss-devel libcap-ng-devel libnet-devel tar make \
libnetfilter_queue-devel lua-devel libmaxminddb-devel rustc cargo lz4-devel \
git python3 python3-pyyaml libtool gcc-c++

git clone https://github.com/OISF/suricata.git
cd suricata
git clone https://github.com/OISF/libhtp.git
./autogen.sh
./configure
make
sudo make install
```
