# alecharp/get-videos

## Description

This docker image enable you to download any video from youtube, for example, in its best audio and video quality, without having to install any software on your computer, beside of `docker`.

## Usage

```bash
docker pull alecharp/get-videos:[stable|latest|<version>]
docker run -v $(pwd):/downloads -ti alecharp/get-videos $VIDEO_URL
```
