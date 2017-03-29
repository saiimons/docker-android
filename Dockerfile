FROM ubuntu

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

COPY install.sh install.sh

RUN apt-get update && apt-get install -y wget software-properties-common && \
	add-apt-repository ppa:openjdk-r/ppa && apt-get update && apt-get install -y openjdk-8-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    chmod +x install.sh && sync && ./install.sh && rm install.sh
