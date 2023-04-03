ARG TAG=latest
FROM alpine:${TAG}
RUN apk add --update --no-cache tftp-hpa
COPY ./tmp/**.kpxe /var/tftpboot/.
COPY ./downstream/config.ipxe /var/tftpboot/config.ipxe
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--secure", "/var/tftpboot"]
