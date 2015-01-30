#!/bin/sh

## Author: Adrien Lecharpentier <adrien.lecharpentier@gmail.com>
##
## Download youtube video and sound and merge them into one file named after
## the youtube video title.

download() {
 youtube-dl \
  -f bestvideo+bestaudio \
  -o '/downloads/%(uploader)s/%(title)s-%(id)s.%(ext)s' \
  $@
}

download $@
