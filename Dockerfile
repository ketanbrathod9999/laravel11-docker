FROM php:8.3-apache

WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        unzip \
        git \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


CMD ["apache2-foreground"]