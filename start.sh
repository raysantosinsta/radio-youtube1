#!/bin/bash
echo "Iniciando Rádio 24/7 (Modo de Baixo Consumo de CPU)..."

ffmpeg -re -stream_loop -1 -i "audio.MP3" \
-loop 1 -framerate 15 -i "back.png" \
-c:v libx264 -preset ultrafast -tune stillimage -s 1280x720 -pix_fmt yuv420p \
-b:v 1500k -maxrate 1500k -bufsize 3000k -g 30 \
-c:a aac -b:a 128k -ar 44100 \
-f flv "rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_STREAM_KEY"