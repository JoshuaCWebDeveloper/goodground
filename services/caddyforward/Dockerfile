FROM balenalib/aarch64-debian

WORKDIR /usr/bin

COPY ./caddy_linux_arm64_custom ./caddy
RUN chmod +x caddy

WORKDIR /etc/caddy

COPY ./config.json .

CMD ["caddy","run", "--config", "./config.json"]
