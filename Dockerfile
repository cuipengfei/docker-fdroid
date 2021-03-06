# Compiles and installs an fdroid environment

FROM ubuntu:16.10
MAINTAINER Cui Pengfei <cuipengfei2008@gmail.com>

# Enable i386 arch (for android SDK)
RUN dpkg --add-architecture i386

# Required dependencies
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    python-dev \
    python-pip \
    git \
    tree \
    default-jdk \
    wget \
    fdroidserver \
    zlib1g-dev \
    inotify-tools \
    libstdc++6:i386 \
    zlib1g:i386

RUN pip install pillow

# Android SDK
ENV ANDROID_HOME /sdk
RUN wget http://dl.google.com/android/android-sdk_r22.3-linux.tgz
RUN tar xvzf android-sdk_r22.3-linux.tgz && mv android-sdk-linux $ANDROID_HOME && rm android-sdk_r22.3-linux.tgz

# Add android tools and platform tools to PATH
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

# Install latest android (19 / 4.4.2) tools and system image.
RUN echo "y" | android update sdk --no-ui --force --filter platform-tools,android-19,build-tools-19.1.0,sysimg-19

ADD run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

VOLUME ["/apk"]

CMD ["/usr/local/bin/run.sh"]
