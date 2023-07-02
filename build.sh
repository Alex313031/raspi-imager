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
	printf "${bold}${YEL}Use the --clean flag to clean the build output directory.${c0}\n" &&
	printf "\n"
}
case $1 in
	--help) displayHelp; exit 0;;
esac

# --clean
cleanBuild () {
	printf "\n" &&
	printf "${bold}${YEL}Cleaning build output directory.${c0}\n" &&
	rm -r -v ./build
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
printf "${GRE}${bold}Build Completed! ${YEL}${bold}You can now sudo make install or make install to install it.\n" &&
printf "\n" &&
tput sgr0 &&

exit 0
