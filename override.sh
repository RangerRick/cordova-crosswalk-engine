#!/bin/sh
set -i

mkdir -p "temp-$$"
MYDIR=`dirname $0`
MYDIR=`cd $MYDIR; pwd`

#export CLASSPATH="/Users/ranger/Applications/Android-SDK/platforms/android-19/android.jar:$MYDIR/libs/xwalk_core_library/libs/xwalk_core_library_java_app_part.jar:$MYDIR/libs/xwalk_core_library/libs/xwalk_core_library_java_library_part.jar"
export CLASSPATH="/Users/ranger/Applications/Android-SDK/platforms/android-19/android.jar:$MYDIR/libs/xwalk_core_library/libs/xwalk_core_library_java_library_part.jar"

javac -source 1.6 -target 1.6 -d "temp-$$" \
	src/android-override/*.java

pushd "temp-$$"
	zip -r -u "../libs/xwalk_core_library/libs/xwalk_core_library_java_library_part.jar" *
popd

rm -rf "temp-$$"
