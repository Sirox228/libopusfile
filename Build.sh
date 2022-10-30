NDK=${ANDROID_NDK_HOME}

cd opusfile
./autogen.sh
FLAGS="--enable-assertions --disable-http --disable-examples --disable-doc"
./configure $FLAGS
cd ../

ls /usr/local/lib

PKG_CONFIG_PATH=includes

echo "starting"

${NDK}/ndk-build NDK_PROJECT_PATH=./ NDK_APPLICATION_MK=./Application.mk APP_BUILD_SCRIPT=./Android.mk

echo "done"
