#!/bin/sh -e

mkdir -p "temp-$$"
export CLASSPATH="/Users/ranger/Applications/Android-SDK/platforms/android-19/android.jar:libs/xwalk_core_library/libs/xwalk_core_library_java.jar"

javac -source 1.6 -target 1.6 -d "temp-$$" \
	src/android-override/*.java

pushd "temp-$$"
	zip -r -u "../libs/xwalk_core_library/libs/xwalk_core_library_java.jar" *
popd

rm -rf "temp-$$"
