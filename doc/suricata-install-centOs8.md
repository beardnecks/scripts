# Install Suricata on CentOS 8

```
yum update
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
yum -y install \
                texlive-latex \
                texlive-cmap \
                texlive-collection-latexrecommended \
                texlive-fncychap \
                texlive-titlesec \
                texlive-tabulary \
                texlive-framed \
                texlive-wrapfig \
                texlive-upquote \
                texlive-capt-of \
                texlive-needspace 
cargo install --force cbindgen
export PATH="$PATH:$HOME/.cargo/bin"
pip install PyYAML

git clone https://github.com/OISF/suricata.git
cd suricata
git clone https://github.com/OISF/libhtp -b 0.5.x
cd suricata-update
curl -L \
              https://github.com/OISF/suricata-update/archive/master.tar.gz | \
              tar zxvf - --strip-components=1
cd ..
./autogen.sh
./configure --enable-unittests \
                --enable-debug \
                --enable-lua \
                --enable-geoip \
                --enable-profiling \
                --enable-profiling-locks
make -j 8
make check
```
