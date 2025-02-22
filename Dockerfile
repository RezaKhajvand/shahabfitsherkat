# 1. استفاده از Nginx به عنوان وب سرور
FROM nginx:alpine

# 2. کپی کردن فایل‌های بیلد شده به مسیر Nginx
COPY build/web /usr/share/nginx/html

# اضافه کردن کانفیگ Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# 3. اکسپوز کردن پورت 80
EXPOSE 3000

# 4. اجرای Nginx
CMD ["nginx", "-g", "daemon off;"]
