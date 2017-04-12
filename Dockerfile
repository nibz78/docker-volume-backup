FROM armhf/alpine:latest

WORKDIR /root/

RUN apk add --update curl ca-certificates dcron mysql-client &&  \
    curl https://dl.minio.io/client/mc/release/linux-arm/mc > /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

ENV CRON_TIME="0 0 * * *" 

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

