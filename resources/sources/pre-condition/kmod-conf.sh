#!/bin/bash

set -e

./autogen.sh

./configure CFLAGS='-g -O2' --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib64  --enable-debug --enable-python
set +e
make tar -j$(nproc)
set -e
mv kmod*.tar.xz ..
cd ..
rm -rf kmod
tar xf kmod*.tar.xz
rm kmod*.tar.xz
mv kmod* kmod