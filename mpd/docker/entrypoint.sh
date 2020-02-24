#!/bin/bash

# Set headphones
amixer cset numid=3 1

# Set default queue
mpc clear
ls /mpd/playlists/*.m3u | xargs cat | xargs mpc insert

/usr/bin/mpd --no-daemon --stdout /mpd/conf/mpd.conf
