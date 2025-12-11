FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine32 wine64 winetricks xvfb wget && \
    apt clean

# preparar wineprefix y display virtual
ENV WINEPREFIX=/app/wineprefix
ENV DISPLAY=:0

# instalar VC++ 2008 con xvfb-run (esto evita el crash del exit 8)
RUN mkdir -p /tmp/vc && \
    wget -O /tmp/vc/vcredist_x86.exe "https://download.microsoft.com/download/1/1/1/111BA6D7-9B97-4C51-AA78-0E792F62A93B/vcredist_x86.exe" && \
    wineboot --init && \
    xvfb-run -a wine /tmp/vc/vcredist_x86.exe /quiet /norestart

COPY server/ /app/server/
COPY start.sh /start.sh

RUN chmod +x /start.sh

WORKDIR /app/server

CMD ["/bin/bash", "/start.sh"]
