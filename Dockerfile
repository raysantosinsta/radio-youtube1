FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean

WORKDIR /app
COPY . .

RUN chmod +x start.sh

CMD ["./start.sh"]