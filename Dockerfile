FROM debian:buster as BUILDER

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        unzip \
        wget \
        ca-certificates

RUN mkdir -p /var/www
RUN cd /var/www && \
    wget -O EasyEDA-Router-v0.8.11.zip 'https://image.easyeda.com/files/EasyEDA-Router-v0.8.11.zip'
RUN cd /var/www && \
    unzip EasyEDA-Router-v0.8.11.zip

RUN sed -i s^127.0.0.1^0.0.0.0^g /var/www/config/local/main.json

ADD entrypoint.sh /var/www
RUN chmod +x /var/www/entrypoint.sh

RUN rm -f /var/www/EasyEDA-Router-v0.8.11.zip

####
FROM debian:buster
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        default-jre \
        && rm -rf /var/lib/apt/lists/*

COPY --from=BUILDER /var/www/ /var/www/

WORKDIR /var/www
CMD ["/var/www/entrypoint.sh"]
