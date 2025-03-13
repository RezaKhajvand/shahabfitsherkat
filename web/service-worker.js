self.addEventListener('install', event => {
  // فورس کردن نصب سرویس‌ورکر جدید
  self.skipWaiting(); // سرویس‌ورکر جدید فوراً فعال می‌شود
});

self.addEventListener('activate', event => {
  // پاک کردن کش قدیمی
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          return caches.delete(cacheName); // کش‌های قدیمی را پاک می‌کند
        })
      );
    })
  );
});

self.addEventListener('fetch', event => {
  // رد کردن کش‌ها و بارگذاری مستقیم از شبکه
  event.respondWith(fetch(event.request));
});
