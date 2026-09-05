#!/bin/sh
set -e

# Default port to 8000 or use Koyeb's dynamic $PORT
PORT=${PORT:-8000}
echo "Configuring Nginx to listen on port ${PORT}..."
sed -i "s/listen 8000;/listen ${PORT};/g" /etc/nginx/sites-available/default 2>/dev/null || true

# Ensure permissions
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Clear stale caches
php artisan view:clear || true
php artisan config:clear || true

echo "Starting Supervisor (PHP-FPM + Nginx)..."
exec /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf
