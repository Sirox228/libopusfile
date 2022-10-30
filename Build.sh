NDK=${ANDROID_NDK_HOME}

cd opusfile
./autogen.sh
FLAGS="--enable-assertions=yes --disable-examples --disable-doc"
./configure $FLAGS
cd ../

echo ${PKG_CONFIG_PATH}

echo "starting"

${NDK}/ndk-build NDK_PROJECT_PATH=./ NDK_APPLICATION_MK=./Application.mk APP_BUILD_SCRIPT=./Android.mk

echo "done"
