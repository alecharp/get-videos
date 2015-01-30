# alecharp/get-videos

## Description

This docker image enable you to download any video from youtube, for example, in its best audio and video quality, without having to install any software on your computer, beside of `docker`.

## Usage

```bash
docker pull alecharp/get-videos:[latest|unstable|<version>]
docker run -v $(pwd):/downloads -ti alecharp/get-videos $VIDEO_URL [$VIDEO_URL...]
```

## Changelog

### v1.0

 - first image release
 - download and merge best video and audio
 - use volume `/downloads` to store the files
 - create hierarchy of folder based on the video's uploader's name
