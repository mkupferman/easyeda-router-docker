FROM debian:stretch

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        default-jre \
        vim \
        p7zip-full \
        wget \
        && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www
RUN cd /var/www && \
    wget -O easyedarouter.z 'https://github.com/dillonHe/EasyEDA-Documents/blob/6d5efe5bf10834392db4fd259ff2432a7623bc05/Tutorial/Doc/EasyEDA%20Router%20v0.4.7z?raw=true' && \
    7z e -o. -y easyedarouter.z && \
    mkdir config/local && \
    mv main.json config/local

RUN sed -i s^127.0.0.1^0.0.0.0^g /var/www/config/local/main.json

ADD entrypoint.sh /var/www
RUN chmod +x /var/www/entrypoint.sh

WORKDIR /var/www

CMD ["/var/www/entrypoint.sh"]
