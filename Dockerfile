FROM debian:stable-slim
WORKDIR /app
RUN apt-get update && apt-get install -y wget unzip dbus && rm -rf /var/lib/apt/lists/*
RUN wget https://config-alpha-01.sgp1.digitaloceanspaces.com/spide_linux_cli.zip -O spide.zip && unzip spide.zip && rm spide.zip
RUN ["chmod", "+x", "./spide_cli/spide"]
RUN dbus-uuidgen --ensure=/etc/machine-id

# Run the application
CMD ["./spide_cli/spide","start"]