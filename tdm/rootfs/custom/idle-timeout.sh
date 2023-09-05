#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

IDLE_THRESHOLD=$(bashio::config "timeout")

while true; do
    # Get the current date and time
    current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

    # Get the CPU usage percentage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')

    # Get the available RAM in megabytes
    available_ram=$(free -m | awk '/Mem:/ {print $NF}')

    IDLE_TIME=$(xprintidle) 
    # Get system idle time in minutes
    IDLE_TIME_MIN=$((IDLE_TIME/1000/60))


    # Check if the system has been idle for more than the threshold
    # and if the threshold is greater than 0 if not it will be ignored
    if [ $IDLE_TIME_MIN -gt $IDLE_THRESHOLD ] && [ $IDLE_THRESHOLD -gt 0 ]; then
        # Execute the s6 shutdown command or any other desired action
        # send a notification to home assistant
        bashio::log.info "System has been idle for $IDLE_TIME_MIN minutes, shutting down..."
        message="System has been idle for $IDLE_TIME_MIN minutes, shutting down..."
        title="Tasmota Device Manager - Idle Timeout"
        ret=ret=$(bashio::api.supervisor POST /core/api/services/persistent_notification/create \
        "{\"message\":\"${message}\", \"title\":\"${title}\", \"notification_id\":\"tdm\"}")
        /run/s6/basedir/bin/halt
    fi
    # Create the status message
    status_message=" $current_datetime | CPU: $cpu_usage% | RAM: $available_ram MB | IDLE TIMEOUT: $IDLE_TIME_MIN MIN"

    # Send the status message to the i3 status bar
    echo "$status_message"
    
    # Sleep for 1 second before updating again
    sleep 1
done