#!/bin/bash

# Set headphones
amixer cset numid=3 1

/usr/bin/mpd --no-daemon --stdout /mpd/conf/mpd.conf
