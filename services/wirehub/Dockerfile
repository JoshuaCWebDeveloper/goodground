FROM balenalib/aarch64-debian

WORKDIR /wireguard
RUN install_packages wireguard-tools mawk grep iproute2 qrencode wget

RUN wget https://raw.githubusercontent.com/burghardt/easy-wg-quick/master/easy-wg-quick
RUN chmod +x easy-wg-quick

CMD ["balena-idle"]
