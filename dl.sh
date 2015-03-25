#!/bin/bash

## Author: Adrien Lecharpentier <adrien.lecharpentier@gmail.com>
##
## Download youtube video and sound and merge them into one file named after
## the youtube video title.

OPTS=$(getopt -o a:f: -l "audio:,format:" -n "getopt.sh" -- "$@")
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
    --audio-format "mp3" \
    -o $PATTERN \
    $@
}

usage() {
  echo "usage: [--audio [--format m4a|mp3]] URL"
  exit 1
}

if [ $# -eq 0 ]; then
  usage
fi

eval set -- "$OPTS"
while true ; do
  case "$1" in
    -a|--audio)
      audio $2;
      shift 2;
      ;;
    --)
      shift;
      video $@
      break;
      ;;
  esac
done

exit 0
