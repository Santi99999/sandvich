FROM ubuntu:22.04

# wine
RUN dpkg --add-architecture i386 && 
	apt update && 
	apt install -y wine32 wine64 xvfb winbind && 
	apt clean

# copiar a /app
COPY . /app
WORKDIR /app

# permisos
RUN chmod +x /app/start.sh

# ejecutar

CMD ["/bin/bash", "/app/start.sh"]

