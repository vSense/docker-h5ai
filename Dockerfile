FROM vsense/nginx:php7-fpm

MAINTAINER vSense <docker@vsense.fr>

ENV PKGVER 0.29.0

RUN apk add --update  \
    ffmpeg \
    libwebp@edge \
    php7-gd@edge \
    php7-exif@edge \
    php7-json@edge \
    php7-session@edge \
    imagemagick@edge \
    zip \
    wget \
    && wget --no-check-certificate https://release.larsjung.de/h5ai/h5ai-"$PKGVER".zip -P /tmp \
    && unzip /tmp/h5ai-"$PKGVER".zip -d /var/www \
    && apk del wget \
    && rm -rf /var/cache/apk/* /tmp/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
