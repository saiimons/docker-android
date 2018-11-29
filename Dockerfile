FROM gradle:4.10.2-jdk8

USER root

# Install Build Essentials
RUN apt-get update -qq && \
    apt-get install build-essential file apt-utils -y

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    ANDROID_HOME="/usr/local/android-sdk"
ARG ANDROID_VERSION
ARG ANDROID_BUILD_TOOLS_VERSION

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager \
    "platforms;android-${ANDROID_VERSION}" \
    "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "platform-tools"
