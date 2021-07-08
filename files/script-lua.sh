#!/bin/bash

cd &&
luarocks install basexx &&
wget -c https://launchpad.net/~rael-gc/+archive/ubuntu/rvm/+files/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb &&
wget -c https://launchpad.net/~rael-gc/+archive/ubuntu/rvm/+files/libssl1.0-dev_1.0.2n-1ubuntu5.3_amd64.deb &&
dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb &&
dpkg -i libssl1.0-dev_1.0.2n-1ubuntu5.3_amd64.deb &&
luarocks install luacrypto &&
mkdir src &&
cd src &&
luarocks download lua-cjson &&
luarocks unpack lua-cjson-2.1.0.6-1.src.rock &&
cd lua-cjson-2.1.0.6-1/lua-cjson &&
sed -i 's/lua_objlen/lua_rawlen/g' lua_cjson.c &&
sed -i 's|$(PREFIX)/include|/usr/include/lua5.2|g' Makefile &&
luarocks make &&
luarocks install luajwtjitsi &&
cd &&
rm -r src &&
rm *.deb
