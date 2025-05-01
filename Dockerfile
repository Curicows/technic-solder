FROM curicows/php-laravel:latest

ADD --chown="www-data:www-data" . /var/www/html

# renovate: datasource=github-releases depName=TechnicPack/TechnicSolder
ENV SOLDER_VERSION=0.11.0

ENV PHP_FPM_POOL_NAME="technic-solder"

# Download Technic Solder
RUN curl -sSLo - https://github.com/TechnicPack/TechnicSolder/archive/refs/tags/v${SOLDER_VERSION}.tar.gz | tar -xzf - --strip 1 -C /var/www/html

# Remove envs
RUN rm -f /var/www/html/.env*

## Install dependencies
RUN composer install --no-interaction

COPY  ./config /var/www/html/config
