self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          // پاک کردن کش‌های قدیمی
          return caches.delete(cacheName);
        })
      );
    })
  );
});

self.addEventListener('activate', (event) => {
  // پس از نصب سرویس ورکر، فایل‌های جدید باید استفاده شوند
  event.waitUntil(self.clients.claim());
});

// در اینجا می‌توانید عملیات caching خود را اضافه کنید
