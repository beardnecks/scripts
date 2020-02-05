# Testing Suricata

Versioning is done through version number on first line of `configure.ac`

## Ubuntu Steps
Install Dependencies:
```
sudo apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev \
build-essential autoconf automake libtool libpcap-dev libnet1-dev \
libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 \
make libmagic-dev libjansson-dev libjansson4 pkg-config

# For IPS mode, also install:
sudo apt-get -y install libnetfilter-queue-dev libnetfilter-queue1 \
libnfnetlink-dev libnfnetlink0
```

Clone repository:
```
git clone git@github.com:OISF/suricata.git
cd suricata
```

Clone libHTP into suricata folder:

```
git clone git@github.com:OISF/libhtp.git
```

Clone suricata test library into suricata folder:

```
git clone git@github.com:OISF/suricata-verify.git
```

`TEMPORARY FIX pre 6.0:` Merge regits updated buildbot config (Should fast forward):
```
git pull git@github.com:regit/suricata.git qa-docker-update-v3
```

## CentOS 8 Steps
Install Dependencies:
```
sudo apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev \
build-essential autoconf automake libtool libpcap-dev libnet1-dev \
libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 \
make libmagic-dev libjansson-dev libjansson4 pkg-config

# For IPS mode, also install:
sudo apt-get -y install libnetfilter-queue-dev libnetfilter-queue1 \
libnfnetlink-dev libnfnetlink0
```

Clone repository:
```
git clone git@github.com:OISF/suricata.git
cd suricata
```

Clone libHTP into suricata folder:

```
git clone git@github.com:OISF/libhtp.git
```

Clone suricata test library into suricata folder:

```
git clone git@github.com:OISF/suricata-verify.git
```

`TEMPORARY FIX pre 6.0:` Merge regits updated buildbot config:
```
git pull git@github.com:regit/suricata.git qa-docker-update-v3
```

Autogen make files:

```
./autogen.sh
```

## Different tests performed by buildbot

### Factory - gcc
```
./autogen.sh
./configure
make
make clean
make distcheck
```

### factory_devel - debug
```
./autogen.sh
./configure --enable-debug --enable-unittests
make
make clean
DISTCHECK_CONFIGURE_FLAGS="--enable-debug --enable-unittests" make distcheck
```

### factory_profiling - profiling
```
./autogen.sh
./configure --enable-debug --enable-profiling --enable-unittests
make
make clean
DISTCHECK_CONFIGURE_FLAGS="--enable-debug --enable-profiling --enable-unittests" make distcheck
```

### factory_clang - (NOT USED)
```
./autogen.sh
CC="clang" CFLAGS="-fsanitize=address" ./configure --enable-debug --enable-unittests
CC="clang" ./configure --enable-debug --enable-unittests ac_cv_func_malloc_0_nonnull="yes" ac_cv_func_realloc_0_nonnull="yes"
make
make clean
```

### factory_clang_32 - clang
```
./autogen.sh
CC="clang" CFLAGS="-fsanitize=address" ./configure --enable-debug --enable-unittests ac_cv_func_malloc_0_nonnull="yes" ac_cv_func_realloc_0_nonnull="yes"
make
make clean
```

### factory_features - features
```
./autogen.sh
./configure --enable-debug --enable-unittests --enable-nfqueue --enable-nflog --enable-lua --enable-prelude
make
make clean
DISTCHECK_CONFIGURE_FLAGS="--enable-debug --enable-unittests --enable-nfqueue --enable-nflog --enable-lua --enable-prelude" make distcheck
```

### factory_stress_pcap - pcaps
```
./autogen.sh
CFLAGS="-fsanitize=address -fno-omit-frame-pointer" ./configure --enable-debug-validation
make
sudo make install
sudo rm -rf /usr/local/etc/suricata/suricata.yaml
sudo make install-conf
/data/oisf/qa/suricata-verify/run.py --outdir /tmp
make clean
sudo ldconfig
# for pcap in /data/oisf/qa/docker/pcaps add to pcaps_list
# for pfile in pcaps_list
#   sudo /usr/localbin/suricata -r pfile --init-errors-fatal -S /data/oisf/rules/http-events.rules
sudo rm -rf /usr/local/var/log/suricata/
```

## UBScan
UndefinedBehaviorSanitizer using clang[https://redmine.openinfosecfoundation.org/projects/suricata/wiki/UBSan](https://redmine.openinfosecfoundation.org/projects/suricata/wiki/UBSan):
```
export CC="clang"
export CFLAGS="-O2 -ggdb3 -Werror -Wchar-subscripts -fno-strict-aliasing -fstack-protector-all \
        -fsanitize=bool,bounds,enum,float-cast-overflow,float-divide-by-zero,nonnull-attribute,null,object-size,return,returns-nonnull-attribute,shift,signed-integer-overflow,unreachable,vla-bound,vptr \
        -fno-sanitize-recover=bool,bounds,enum,float-cast-overflow,float-divide-by-zero,nonnull-attribute,null,object-size,return,returns-nonnull-attribute,shift,signed-integer-overflow,unreachable,vla-bound \
        -fno-omit-frame-pointer"
./autogen.sh
./configure
make
```

## AFL fuzz testing

## Things to consider:
1. cppcheck
  * Rules?
  * std
  * fail?
2. 
