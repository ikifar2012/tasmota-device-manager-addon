ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
# Install dependencies
RUN apk add --update-cache --no-cache \
py3-pip=23.2.1-r0 \
novnc=1.4.0-r0 \
i3wm=4.22-r1 \
i3status=2.14-r1 \
py3-qt5=5.15.9-r3 \
x11vnc=0.9.16-r5 \
websockify=0.11.0-r1 \
nginx=1.24.0-r11

COPY rootfs /
# ensure that each service in services.d has executable permissions
RUN chmod -R +x /etc/services.d/

RUN pip install --no-cache-dir --no-depends \
-r /tmp/requirements.txt