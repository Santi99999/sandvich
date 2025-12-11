FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine32 wine64 xvfb winbind wget && \
    apt clean

# instalar VC++ 2008 (requerido por mfc90.dll)
RUN mkdir -p /tmp/vc && \
    wget -O /tmp/vc/vcredist_x86.exe "https://download.microsoft.com/download/1/1/1/111BA6D7-9B97-4C51-AA78-0E792F62A93B/vcredist_x86.exe" && \
    WINEPREFIX=/app/wineprefix wineboot --init && \
    WINEPREFIX=/app/wineprefix wine /tmp/vc/vcredist_x86.exe /quiet /norestart

COPY server/ /app/server/
COPY start.sh /start.sh

RUN chmod +x /start.sh

WORKDIR /app/server

CMD ["/bin/bash", "/start.sh"]
