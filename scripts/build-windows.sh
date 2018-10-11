#!/bin/bash

NB_CORES=`nproc`

# Useful variables
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BLUE_READ=$'\e[34m'
NC='\033[0m'
NC_READ=$'\e[0m'

export PATH=/mnt/mxe/usr/bin:$PATH
echo -e "\n${GREEN}Entering GanjaCoin Folder${NC}"
cd ..
echo -e "\n${GREEN}Cleaning${NC}"
make clean
echo -e "\n${GREEN}Compiling Windows Wallet${NC}"





MXE_INCLUDE_PATH=/mnt/mxe/usr/i686-w64-mingw32.static/include
MXE_LIB_PATH=/mnt/mxe/usr/i686-w64-mingw32.static/lib

i686-w64-mingw32.static-qmake-qt5 \
	BOOST_LIB_SUFFIX=-mt \
	BOOST_THREAD_LIB_SUFFIX=_win32-mt \
	BOOST_INCLUDE_PATH=$MXE_INCLUDE_PATH/boost \
	BOOST_LIB_PATH=$MXE_LIB_PATH \
	OPENSSL_INCLUDE_PATH=$MXE_INCLUDE_PATH/openssl \
	OPENSSL_LIB_PATH=$MXE_LIB_PATH \
	BDB_INCLUDE_PATH=$MXE_INCLUDE_PATH \
	BDB_LIB_PATH=$MXE_LIB_PATH \
	MINIUPNPC_INCLUDE_PATH=$MXE_INCLUDE_PATH \
	MINIUPNPC_LIB_PATH=$MXE_LIB_PATH \
	QRENCODE_INCLUDE_PATH=$MXE_INCLUDE_PATH \
	QRENCODE_LIB_PATH=$MXE_LIB_PATH \
	QMAKE_LRELEASE=/mnt/mxe/usr/i686-w64-mingw32.static/qt5/bin/lrelease Ganjaproject.pro "USE_QRCODE=0"

make -f Makefile.Release

echo -e "\n${GREEN}Build Complete - Ganjacoin-qt.exe is in the \"release\" folder${NC}"
