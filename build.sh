#!/bin/bash
ANDROID_VERSION=28
ANDROID_BUILD_TOOLS_VERSION=28.0.3
docker build \
        --build-arg ANDROID_VERSION=${ANDROID_VERSION} \
        --build-arg ANDROID_BUILD_TOOLS_VERSION=${ANDROID_BUILD_TOOLS_VERSION} \
        -t saiimons/android-sdk:platform${ANDROID_VERSION}-tools${ANDROID_BUILD_TOOLS_VERSION} \
        .