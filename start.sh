#!/bin/bash
echo "Iniciando Rádio 24/7 com correção de timestamps..."

ffmpeg -re -fflags +genpts -loop 1 -framerate 30 -i "back.png" -re -stream_loop -1 -i "audio.MP3" \
-c:v libx264 -preset ultrafast -tune stillimage -s 1280x720 -pix_fmt yuv420p \
-b:v 2000k -maxrate 2000k -bufsize 4000k -g 60 -keyint_min 60 \
-c:a aac -b:a 128k -ar 44100 \
-f flv "rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_STREAM_KEY"