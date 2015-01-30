#!/bin/bash

## Author: Adrien Lecharpentier <adrien.lecharpentier@gmail.com>
##
## Download youtube video and sound and merge them into one file named after
## the youtube video title.

PATTERN='/downloads/%(uploader)s/%(title)s-%(id)s.%(ext)s'

video() {
  youtube-dl \
    -f bestvideo+bestaudio \
    -o $PATTERN \
    $@
}

audio() {
  youtube-dl \
    -f bestaudio \
    -o $PATTERN \
    $@
}

usage() {
  echo "usage: URL [URL...]"
  exit 1
}

if [ $# -eq 0 ]; then
  usage
fi
video $@
