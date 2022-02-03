FROM balenalib/aarch64-debian

WORKDIR /wireguard
RUN install_packages wireguard-tools mawk grep iproute2 qrencode wget nano resolvconf || :

CMD ["balena-idle"]
