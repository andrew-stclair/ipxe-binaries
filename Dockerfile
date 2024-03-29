ARG TAG=latest
FROM alpine:${TAG}
RUN apk add --update --no-cache tftp-hpa
COPY ./tmp/* /var/tftpboot/.
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--secure", "/var/tftpboot"]
