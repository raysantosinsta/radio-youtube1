#!/bin/bash
echo "Lista de arquivos que o Railway está enxergando:"
ls -la

echo "Iniciando Rádio 24/7 com loop de 1 hora..."

ffmpeg -loop 1 -framerate 2 -i "back.png" -stream_loop -1 -i "audio.MP3" \
-c:v libx264 -preset ultrafast -b:v 2500k -maxrate 2500k -bufsize 5000k \
-pix_fmt yuv420p -g 60 -c:a aac -b:a 128k -ar 44100 \
-f flv "rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_STREAM_KEY"