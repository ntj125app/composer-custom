FROM composer:latest

# Install PECL Redis extension
RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} && \
    pecl install redis && \
    docker-php-ext-enable redis