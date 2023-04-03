ARG TAG=latest
FROM alpine:${TAG}
RUN apk add --update --no-cache tftp-hpa
COPY ./tmp/ipxe-i386.kpxe /var/tftpboot/ipxe-i386.kpxe
COPY ./tmp/ipxe-i386.efi /var/tftpboot/ipxe-i386.efi
COPY ./tmp/ipxe-x86_64.efi /var/tftpboot/ipxe-x86_64.efi
COPY ./tmp/ipxe-arm32.efi /var/tftpboot/ipxe-arm32.efi
COPY ./tmp/ipxe-arm64.efi /var/tftpboot/ipxe-arm64.efi
COPY ./downstream/config.ipxe /var/tftpboot/config.ipxe
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--secure", "/var/tftpboot"]
