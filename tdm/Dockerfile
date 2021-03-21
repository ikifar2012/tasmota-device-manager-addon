ARG BUILD_FROM
FROM homeassistant/amd64-base-debian:buster

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install dependencies
ARG BUILD_ARCH
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        iproute2 \
        iputils-ping \
        kmod \
        libcap2-bin \
        libqt5core5a \
        libqt5gui5 \
        libqt5network5 \
        libqt5serialport5 \
        libqt5sql5 \
        libqt5websockets5 \
        libqt5widgets5 \
        lsof \
        netcat \
        nginx \
        novnc \
        sqlite3 \
        tigervnc-common \
        tigervnc-standalone-server \
        wget \
        wmii \
        xfonts-base \
        xfonts-scalable

RUN apt-get install libqt5x11extras5 python3 python3-pip git -y --no-install-recommends
RUN apt-get install libqt5gui5 -y && rm -rf /var/lib/apt/lists/* 
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install wheel
RUN python3 -m pip install pyqt5
RUN python3 -m pip install setuptools
RUN python3 -m pip install tdmgr==0.2.9
RUN python3 -m pip install PyQtWebEngine

COPY rootfs /
