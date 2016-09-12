FROM vsense/nginx:php7

MAINTAINER vSense <docker@vsense.fr>

ENV PKGVER 0.29.0

RUN apk add --update  \
    ffmpeg \
    libwebp \
    php7-gd@community \
    php7-exif@community \
    php7-json@community \
    php7-session@community \
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
