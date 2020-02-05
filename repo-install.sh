#/bin/bash

#git repo setup
sudo yum install git -y
git clone https://github.com/OISF/suricata.git
cd suricata/
git clone https://github.com/OISF/libhtp.git
