FROM tobi312/rpi-mpd

RUN apt-get update && \
    apt-get install -y alsa-utils && \
    usermod -a -G audio mpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache
