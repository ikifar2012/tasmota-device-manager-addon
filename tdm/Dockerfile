ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Add Repositories
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
# Install dependencies
RUN apk add --update-cache --no-cache \
    py3-pip=23.2.1-r0 \
    py3-qt5=5.15.9-r3 \
    py3-qtwebengine=5.15.6-r4 \
    font-cascadia-code-nerd=3.0.2-r0 \
    i3wm=4.22-r1 \
    i3status=2.14-r1 \
    xprintidle=0.2.5-r1 \
    novnc=1.4.0-r0 \
    tigervnc=1.13.1-r4 \
    websockify=0.11.0-r1 \
    nginx=1.24.0-r11

COPY rootfs /
# ensure that each service in services.d has executable permissions
RUN chmod -R +x /etc/s6-rc.d/

RUN pip install --no-cache-dir --no-deps \
    -r /custom/requirements.txt