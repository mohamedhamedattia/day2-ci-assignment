# استخدام نسخة Python خفيفة وآمنة
FROM python:3.10-slim

# تحديد مجلد العمل داخل الـ Container
WORKDIR /app

# نسخ ملف المتطلبات أولاً للاستفادة من الـ Cache
COPY requirements-dev.txt .

# تثبيت الحزم المطلوبة بدون كاش لتقليل الحجم
RUN pip install --no-cache-dir -r requirements-dev.txt

# نسخ باقي ملفات المشروع
COPY . .

# الأمر الافتراضي لتشغيل التطبيق
CMD ["python", "temperature.py"]
