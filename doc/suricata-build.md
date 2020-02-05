# Building suricata
## CentOS
Clone repo:
```
git clone git@github.com/OISF/suricata.git
cd suricata
# Clone libhtp into same directory
git clone git@github.com/OISF/libhtp.git
```

Install prerequesits:
```
sudo yum -y install gcc libpcap-devel pcre-devel libyaml-devel file-devel \
  zlib-devel jansson-devel nss-devel libcap-ng-devel libnet-devel tar make \
  libnetfilter_queue-devel lua-devel python3-pyyaml libmaxminddb-devel rustc cargo \
  lz4-devel
```

Download tar:
```
tar -xvf suricata.....
cd suricata-x.x.x
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-nfqueue --enable-lua
```

Then:

```
make
sudo make install
sudo ldconfig
```
