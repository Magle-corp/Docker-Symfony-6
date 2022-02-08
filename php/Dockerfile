FROM php:8.0.14-apache

# Set server name for Apache.
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Symfony CLI.
RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list

# Locales.
RUN apt-get update \
    && apt-get install -yqq --no-install-recommends locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

# Essential libraries.
RUN apt-get install -yqq --no-install-recommends locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev libmagickwand-dev exiftool libldap2-dev wget xfonts-75dpi xfonts-base symfony-cli;

COPY php.ini /usr/local/etc/php/php.ini

# Download and move composer.
RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
   mv composer.phar /usr/local/bin/composer

# PHP utiles.
RUN docker-php-ext-configure intl && \
    docker-php-ext-install pdo pdo_mysql gd opcache intl zip calendar dom mbstring xsl && \
    pecl install apcu && docker-php-ext-enable apcu && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    docker-php-ext-configure exif && \
    docker-php-ext-install exif && \
    docker-php-ext-enable exif

# Install ldap.
RUN rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

# Install wkhtmlopdf.
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    apt-get -f install

# Enable Apache mod_rewrite.
RUN a2enmod rewrite

# Set working directory.
WORKDIR /var/www/

# Install.sh script.
COPY install.sh /web/install.sh
RUN chmod +x /web/install.sh

ENTRYPOINT ["/web/install.sh"]
