# Use PHP 7.4 CLI
FROM php:7.4-cli

# 1. Install system dependencies & Postgres headers for Supabase
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libpq-dev

# 2. Install PHP extensions (pdo_pgsql is required for Supabase)
RUN docker-php-ext-install pdo_pgsql pgsql mbstring exif pcntl bcmath gd zip

# 3. Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Set working directory
WORKDIR /var/www/html

# 5. Copy your project files
# Your .dockerignore will prevent 'vendor' from being copied
COPY . .

# 6. Setup .env and permissions
# We ensure the storage and cache folders are writable
RUN cp .env.example .env && \
    chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# 7. Install PHP dependencies
# This runs as root to ensure all system links are created
RUN composer install --no-interaction --no-dev --optimize-autoloader

# 8. Generate App Key
RUN php artisan key:generate
RUN php artisan storage:link
# 9. Expose port 8000
EXPOSE 8000

# 10. Start Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]