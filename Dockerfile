# Use PHP 7.4 FPM
FROM php:7.4-fpm

# 1. Install system dependencies, Nginx, Supervisor & Postgres headers
RUN apt-get update && apt-get install -y \
    git \
    curl \
    nginx \
    supervisor \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Install PHP extensions (pdo_pgsql is required for Supabase)
RUN docker-php-ext-install pdo_pgsql pgsql mbstring exif pcntl bcmath gd zip opcache

# 3. Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Set working directory
WORKDIR /var/www/html

# 5. Copy project files
COPY . .

# 6. Copy Nginx & Supervisor configuration
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /var/www/html/docker/entrypoint.sh

# 7. Setup .env and permissions
RUN cp .env.example .env && \
    chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache && \
    chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# 8. Install PHP dependencies
RUN composer install --no-interaction --no-dev --optimize-autoloader

# 9. Generate App Key & Link Storage
RUN php artisan key:generate && php artisan storage:link

# 10. Expose port 8000
EXPOSE 8000

# 11. Start Supervisor via Entrypoint
CMD ["/var/www/html/docker/entrypoint.sh"]