# h5ai Dockerfile

FROM vsense/nginx:php

MAINTAINER vSense <docker@vsense.fr>

RUN apk add --update  \
    ffmpeg \
    php-gd \
    php-exif \
    php-json \
    imagemagick \
    zip \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
