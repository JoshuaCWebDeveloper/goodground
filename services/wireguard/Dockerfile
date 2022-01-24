FROM balenalib/aarch64-debian as builder

RUN install_packages curl build-essential libelf-dev libssl-dev pkg-config git flex bison

WORKDIR /usr/src/app

RUN git clone https://git.zx2c4.com/wireguard-linux-compat && \
git clone https://git.zx2c4.com/wireguard-tools

ENV VERSION '2.88.4.dev'
ENV BALENA_MACHINE_NAME 'raspberrypi4-64'

RUN curl -L -o headers.tar.gz $(echo "https://files.balena-cloud.com/images/$BALENA_MACHINE_NAME/$VERSION/kernel_modules_headers.tar.gz" | sed -e 's/+/%2B/') && \
tar -xf headers.tar.gz

RUN ln -s /lib64/ld-linux-arm64.so.2  /lib/ld-linux-arm64.so.2 || true
RUN make -C kernel_modules_headers -j$(nproc) modules_prepare

RUN make -C $(pwd)/wireguard-tools/src -j$(nproc) && \
    mkdir -p $(pwd)/tools && \
    make -C $(pwd)/wireguard-tools/src DESTDIR=$(pwd)/tools install

WORKDIR /wesher

RUN install_packages wget
RUN wget -O wesher https://github.com/costela/wesher/releases/latest/download/wesher-arm64
RUN chmod a+x wesher

FROM balenalib/aarch64-debian

WORKDIR /wireguard
COPY --from=builder /usr/src/app/tools /
COPY --from=builder /wesher/wesher .
RUN install_packages kmod wget

COPY run.sh ./
COPY install.sh /install.sh

ENTRYPOINT [ "/install.sh" ]
CMD [ "/wireguard/run.sh" ]