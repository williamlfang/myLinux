cd /tmp

wget -O boost_1_55_0.tar.bz2 http://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.55.0%2F&ts=1385953406&use_mirror=softlayer-ams

tar jxvf boost_1_55_0.tar.bz2
cd boost_1_55_0
chmod +x ./bootstrap.sh
./b2 && ./b2 install
