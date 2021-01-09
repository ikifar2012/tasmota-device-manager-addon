#!/usr/bin/with-contenv bashio
# ==============================================================================
# Setup noVNC
# ==============================================================================
declare ingress_entry
ingress_entry=$(bashio::addon.ingress_entry)
mkdir -p /usr/share/novnc/
touch /usr/share/novnc/vnc_lite.html
sed -i "s#websockify#${ingress_entry#?}/novnc/websockify#g" /usr/share/novnc/vnc_lite.html
