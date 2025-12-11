FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine32 wine64 winetricks xvfb wget unzip && \
    apt clean

ENV WINEPREFIX=/app/wineprefix
ENV DISPLAY=:0

# inicializar wine
RUN wineboot --init

# instalar visual c++ 2008 (mfc90.dll + msvcr90.dll)
RUN xvfb-run -a winetricks -q vcrun2008

COPY server/ /app/server/
COPY start.sh /start.sh

RUN chmod +x /start.sh

WORKDIR /app/server

CMD ["/bin/bash", "/start.sh"]
