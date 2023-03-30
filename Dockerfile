ARG TAG=latest
FROM alpine:${TAG}
LABEL maintainer="Timo Taskinen <timo.taskinen@iki.fi>"
RUN apk add --update --no-cache tftp-hpa
COPY docker/**.kpxe /var/tftpboot/.
COPY docker/**.efi /var/tftpboot/.
COPY docker/**.ipxe /var/tftpboot/.
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--secure", "/var/tftpboot"]
