#!/bin/bash

# Copyright (c) 2023 Alex313031.

YEL='\033[1;33m' # Yellow
CYA='\033[1;96m' # Cyan
RED='\033[1;31m' # Red
GRE='\033[1;32m' # Green
c0='\033[0m' # Reset Text
bold='\033[1m' # Bold Text
underline='\033[4m' # Underline Text

# Error handling
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "${RED}Failed $*"; }

# --help
displayHelp () {
	printf "\n" &&
	printf "${bold}${GRE}Script to build raspi-imager on Linux.${c0}\n" &&
	printf "${bold}${YEL}Use the --deps flag to install build dependencies.${c0}\n" &&
	printf "${bold}${YEL}Use the --clean flag to clean the build output directory.${c0}\n" &&
	printf "\n"
}
case $1 in
	--help) displayHelp; exit 0;;
esac

# --deps
instDeps () {
	printf "\n" &&
	printf "${bold}${YEL}Installing build dependencies...${c0}\n" &&
	sudo apt install build-essential devscripts debhelper cmake git libarchive-dev libcurl4-gnutls-dev qtbase5-dev qtbase5-dev-tools qtdeclarative5-dev libqt5svg5-dev qttools5-dev libgnutls28-dev qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-layouts qml-module-qtquick-templates2 qml-module-qtquick-window2 qml-module-qtgraphicaleffects
}
case $1 in
	--deps) instDeps; exit 0;;
esac

# --clean
cleanBuild () {
	printf "\n" &&
	printf "${bold}${YEL}Cleaning build output directory...${c0}\n" &&
	sudo rm -r -v ./build
}
case $1 in
	--clean) cleanBuild; exit 0;;
esac

printf "\n" &&
printf "${bold}${GRE}Script to build raspi-imager on Linux.${c0}\n" &&
printf "${YEL}Building raspi-imager...\n" &&
printf "${CYA}\n" &&

# Build htop
export NINJA_SUMMARIZE_BUILD=1 &&

mkdir -p ./build &&

cd build &&

cmake ../src -DNDEBUG=1 &&

make VERBOSE=1 V=1 &&

printf "\n" &&
printf "${GRE}${bold}Build Completed! ${YEL}${bold}You can now run make install to install it.\n" &&
printf "\n" &&
tput sgr0 &&

exit 0
