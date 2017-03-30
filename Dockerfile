FROM frekele/gradle:3.3-jdk8

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools



RUN apt-get update && apt-get install -y wget software-properties-common unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    
COPY install.sh install.sh

RUN chmod +x install.sh && sync && ./install.sh && rm install.sh
