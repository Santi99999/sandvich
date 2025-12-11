FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine32 wine64 winetricks xvfb wget unzip && \
    apt clean

ENV WINEPREFIX=/app/wineprefix
ENV DISPLAY=:99

COPY server/ /app/server/
COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

WORKDIR /app

CMD ["bash", "start.sh"]
