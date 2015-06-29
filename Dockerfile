# h5ai Dockerfile

FROM vsense/nginx:php-fpm

MAINTAINER vSense <docker@vsense.fr>

COPY h5ai.zip /tmp/h5ai.zip

RUN apk add --update  \
    ffmpeg \
    php-gd \
    php-exif \
    php-json \
    imagemagick \
    zip \
    && rm -rf /var/cache/apk/*
    && unzip /tmp/h5ai/zip -d /var/www

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
