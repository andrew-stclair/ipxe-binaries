ARG TAG=latest
FROM alpine:${TAG}
RUN apk add --update --no-cache tftp-hpa
COPY ./docker/ipxe-i386.kpxe /var/tftpboot/ipxe-i386.kpxe
COPY ./docker/ipxe-i386.efi /var/tftpboot/ipxe-i386.efi
COPY ./docker/ipxe-x86_64.efi /var/tftpboot/ipxe-x86_64.efi
COPY ./docker/ipxe-arm32.efi /var/tftpboot/ipxe-arm32.efi
COPY ./docker/ipxe-arm64.efi /var/tftpboot/ipxe-arm64.efi
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--secure", "/var/tftpboot"]
