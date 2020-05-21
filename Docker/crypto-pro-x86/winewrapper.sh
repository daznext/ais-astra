#!/bin/bash
cd winewrapper/libcapihelper10
gcc -c -Wall -fpic libcapihelper10.c -I/opt/cprocsp/include/cpcsp/
gcc -shared -o libcapihelper10.so libcapihelper10.o
cp libcapihelper10.h ../

cd ..
#winegcc -shared -lcrypt32 libcapi20.c libcapi20.dll.spec -I/opt/cprocsp/include/cpcsp/ -L/opt/cprocsp/lib/ia32/
#winegcc -shared  libcapi20.c libcapi20.dll.spec -I/opt/cprocsp/include/cpcsp/ -L/opt/cprocsp/lib/ia32/ -lcapi20 -lcsptest
#winegcc -shared  libcapi20.c libcapi20.dll.spec -o libcapi20.dll.so -I/opt/cprocsp/include/cpcsp/ -L/opt/cprocsp/lib/ia32/ -L/home/wineuser/winewrapper/libcapihelper10 -lcapi20 -lcapihelper10
winegcc -shared  libcapi20.c libcapi20.dll.spec -o libcapi20.dll.so -I/opt/cprocsp/include/cpcsp/ -L/opt/cprocsp/lib/ia32/ -L./libcapihelper10 -lcapi20 -lcapihelper10

cd ../Debug
LD_LIBRARY_PATH=/home/wineuser/winewrapper/libcapihelper10/ WINEDLLPATH=/home/wineuser/winewrapper/ wine AKUZ.UserArm.exe

cd ..
