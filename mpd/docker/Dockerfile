FROM tobi312/rpi-mpd@sha256:95eebd82b5077a288a8a98d533f13880c72023f9f79df8ddc0177ba69796a54f

RUN apt-get update && \
    apt-get install -y alsa-utils && \
    usermod -a -G audio mpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

ADD entrypoint.sh /mpd/

ENTRYPOINT ["/mpd/entrypoint.sh"]
