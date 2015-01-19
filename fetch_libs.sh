#!/bin/sh
set -e

VERSION="10.39.235.15"
ARM_DOWNLOAD="https://download.01.org/crosswalk/releases/crosswalk/android/stable/$VERSION/arm/crosswalk-webview-$VERSION-arm.zip";
X86_DOWNLOAD="https://download.01.org/crosswalk/releases/crosswalk/android/stable/$VERSION/x86/crosswalk-webview-$VERSION-x86.zip";

download() {
    TMPDIR=cordova-crosswalk-engine-$$
    mkdir $TMPDIR
    pushd $TMPDIR > /dev/null
    echo "Fetching $1..."
    curl -# $1 -o library.zip
    unzip -q library.zip
    rm library.zip
    PACKAGENAME=$(ls|head -n 1)
    echo "Installing $PACKAGENAME into xwalk_core_library..."
    mkdir -p ../libs/xwalk_core_library/
    rsync -avr $PACKAGENAME/* ../libs/xwalk_core_library/
    popd > /dev/null
    rm -r $TMPDIR
}

rm -rf libs/xwalk_core_library
download $ARM_DOWNLOAD
download $X86_DOWNLOAD
