FROM ubuntu:22.04

# instalar wine
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wine32 wine64 xvfb winbind && \
    apt clean

# copiar todo
COPY . /app
WORKDIR /app

# permisos
RUN chmod +x start.sh

# ejecutar
CMD ["/bin/bash", "start.sh"]
