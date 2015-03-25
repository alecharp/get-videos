# alecharp/get-videos

## Description

This docker image enable you to download any video from youtube, for example, in its best audio and video quality, without having to install any software on your computer, beside of `docker`.

## Usage

```bash
docker pull alecharp/get-videos:[latest|stable|<version>]
docker run -v $(pwd):/downloads -ti alecharp/get-videos [--audio] $VIDEO_URL
```

### Tags

As I'm using the `git-flow` process, `master` is stable, `dev` is unstable, or in-progress and each release has a tag.

The image has 2 evolving tags: `latest` and `stable`. `latest` is built against `dev` branch, which should be considered as unstable. The `master` branch generate a `stable` image. Then there is a tag for every release.

## Changelog

### v1.1

 - support `-a` and `--audio` option to download only the audio part

### v1.0

 - first image release
 - download and merge best video and audio
 - use volume `/downloads` to store the files
 - create hierarchy of folder based on the video's uploader's name
