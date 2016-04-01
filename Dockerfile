FROM vsense/nginx:php7-fpm

MAINTAINER vSense <docker@vsense.fr>

ENV PKGVER 0.28.1

RUN apk add --update  \
    ffmpeg \
    php7-gd \
    php7-exif \
    php7-json \
    imagemagick \
    zip \
    wget \
    && wget --no-check-certificate https://release.larsjung.de/h5ai/h5ai-"$PKGVER".zip -P /tmp \
    && unzip /tmp/h5ai-"$PKGVER".zip -d /var/www \
    && apk del wget \
    && rm -rf /var/cache/apk/* /tmp/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
