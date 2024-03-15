FROM composer:latest

# Install Postgres Database Extension and PECL Redis extension
RUN apk --no-cache update && apk --no-cache upgrade && \
    apk --no-cache add pcre-dev ${PHPIZE_DEPS} && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    apk --no-cache add postgresql-dev && \
    docker-php-ext-install pdo_pgsql && \
    apk del pcre-dev ${PHPIZE_DEPS}

# Check composer version as a test
RUN composer --version
