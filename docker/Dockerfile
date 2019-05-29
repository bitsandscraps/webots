ARG CUDA=10.0
ARG UBUNTU=18.04
FROM nvidia/cudagl:${CUDA}-runtime-ubuntu${UBUNTU}

RUN apt-get update && apt-get install -y \
        cmake \
        ffmpeg \
        git \
        g++ \
        libassimp-dev \ 
        libavcodec-extra \
        libboost-dev \
        libglib2.0-dev \
        libglu1-mesa-dev \ 
        libfreeimage-dev \
        libfreetype6-dev \
        libgd-dev \
        libjpeg8-dev \
        libnss3-dev \
        libpci-dev \
        libpng-dev \
        libreadline-dev \
        libssh-dev \
        libssl-dev \
        libtiff5-dev \
        libusb-dev \
        libxcomposite-dev \
        libxml2-dev \ 
        libxtst-dev \
        libzip-dev \
        libzzip-0-13 \ 
        python2.7-dev \
        python3.6-dev \
        python-pip \
        swig \
        unzip \
        wget \
        zip \
        && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /root/webots
COPY . /root/webots

ARG WEBOTS_DISABLE_SAVE_PERSPECTIVE_ON_CLOSE=1
ARG WEBOTS_ALLOW_MODIFY_INSTALLATION=1
ARG WEBOTS_HOME=/root/webots
ARG LD_LIBRARY_PATH=${WEBOTS_HOME}/lib

RUN cd /root/webots && make -j18

COPY Webots-R2019a.conf /root/.config/Cyberbotics/
