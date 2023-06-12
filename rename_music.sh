#!/bin/bash

for f in ./*.mp3; do \
ffmpeg -i "$f" -i cover.jpg -map_metadata 0 -map 0 -map 1 out-"${f#./}" \
&& mv out-"${f#./}" "$f"; done
