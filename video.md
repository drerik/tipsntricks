# Video Tips and tricks

## Encoding a timelapse with ffmpeg.
This command will encode a set of jpgs to a mp4 file with a h264 codec. With 15 frames per second in 1920 by 1200 resolution.

```
ffmpeg -pattern_type glob  -r 15 -i "*.jpg" -s 1920x1200 -vcodec libx264 timelapse.mp4
```
