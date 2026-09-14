#!/bin/bash
echo "Iniciando Rádio 24/7 (Padrão YouTube HD)..."

ffmpeg -loop 1 -framerate 30 -i "back.png" -stream_loop -1 -i "audio.MP3" \
-vf "scale=1280:720,format=yuv420p" \
-c:v libx264 -preset ultrafast -b:v 2500k -maxrate 2500k -bufsize 5000k \
-g 60 -c:a aac -b:a 128k -ar 44100 \
-f flv "rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_STREAM_KEY"