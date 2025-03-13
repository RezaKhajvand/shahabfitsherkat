self.addEventListener('install', (event) => {
  // Cache files during installation
  event.waitUntil(
    caches.open('my-cache').then((cache) => {
      return cache.addAll([
        '/', 
        '/index.html', 
        '/logo.png', 
        '/flutter_bootstrap.js', 
        '/manifest.json',
        // اضافه کردن فایل‌های دیگر که لازم دارید
      ]);
    })
  );
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((cachedResponse) => {
      // Return the cached response if available, otherwise fetch from the network
      return cachedResponse || fetch(event.request);
    })
  );
});

self.addEventListener('activate', (event) => {
  const cacheWhitelist = ['my-cache'];
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (!cacheWhitelist.includes(cacheName)) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});
