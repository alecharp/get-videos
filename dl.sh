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
  local f;
  test -z $2 && f="mp3" || f="$2";
  youtube-dl \
    -f bestaudio \
    -x \
    --audio-quality 0 \
    --audio-format $f \
    -o $PATTERN \
    $1
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
      if [ "$2" = "-f" ] || [ "$2" = "--format" ]; then
        audio $5 $4;
        shift 5;
      else
        audio $2;
        shift 2;
      fi
      break;
      ;;
    -f|--format)
      echo "This shouldn't happend"
      usage
      ;;
    --)
      shift;
      video $@
      break;
      ;;
  esac
done

exit 0
