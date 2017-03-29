
ANDROID_SDK_FILENAME=android-sdk_r26.0.0-linux.tgz
ANDROID_SDK_URL=http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ANDROID_API_LEVELS=android-15,android-16,android-17,android-18,android-19,android-20,android-21,android-22,android-23,android-24,android-25,android-26

mkdir -p $ANDROID_HOME

wget -q ${ANDROID_SDK_URL} && \
     tar -C $ANDROID_HOME -xzf /${ANDROID_SDK_FILENAME} --strip-components=1 android-sdk-linux && \
     rm ${ANDROID_SDK_FILENAME}

FILTER=tools,platform-tools,extra,${ANDROID_API_LEVELS}

export PATH=$PATH:${ANDROID_HOME}/tools/

${ANDROID_HOME}/tools/android update sdk --no-ui -a -n | grep Build-tools | grep -v Obsolete | cut -d " " -f 6 | while read BTVERSION;
do
	FILTER="${FILTER},build-tools-${BTVERSION}"
done
echo "Installing Android SDK with $FILTER"

echo y | ${ANDROID_HOME}/tools/android update sdk --no-ui --filter ${FILTER} --no-https

mkdir -p $ANDROID_HOME/licenses/
echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
