#!/bin/sh
set -e

# Default port to 8000 or use Koyeb's dynamic $PORT
PORT=${PORT:-8000}
echo "Configuring Nginx to listen on port ${PORT}..."
sed -i "s/listen 8000;/listen ${PORT};/g" /etc/nginx/conf.d/default.conf

# Ensure permissions
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Run optimizations if key exists
php artisan storage:link || true
php artisan view:clear || true
php artisan config:cache || true

echo "Starting Supervisor (PHP-FPM + Nginx)..."
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
