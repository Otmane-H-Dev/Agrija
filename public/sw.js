var cacheName = 'agrija-pwa';
var filesToCache = [
  '/',
  '/frontend/css/style.css',
  '/frontend/css/bootstrap.css',
  '/frontend/css/font-awesome.css',
  '/frontend/css/themify-icons.css',
  '/frontend/js/jquery.min.js',
  '/js/app.js',
  '/images/favicon.png'
];

/* Start the service worker and cache all of the app's content */
self.addEventListener('install', function(e) {
  e.waitUntil(
    caches.open(cacheName).then(function(cache) {
      return cache.addAll(filesToCache);
    }).catch(function(err) {
        console.log('SW cache addAll error:', err);
    })
  );
});

/* Serve cached content when offline */
self.addEventListener('fetch', function(e) {
  e.respondWith(
    caches.match(e.request).then(function(response) {
      return response || fetch(e.request);
    })
  );
});
