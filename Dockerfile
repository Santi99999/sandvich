FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine32 wine64 xvfb winbind && \
    apt clean

COPY server/ /app/server/
COPY start.sh /start.sh

RUN chmod +x /start.sh

WORKDIR /app/server

CMD ["/bin/bash", "/start.sh"]
