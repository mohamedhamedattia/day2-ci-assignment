FROM python:3.13-slim

WORKDIR /app

# نسخ ملف المتطلبات أولاً
COPY requirements-dev.txt .

# تثبيت الحزم بأمان
RUN pip install --no-cache-dir --only-binary :all: -r requirements-dev.txt || pip install --no-cache-dir -r requirements-dev.txt

# نسخ الملفات المطلوبة فقط لمنع نسخ أي بيانات حساسة
COPY temperature.py README.md ./

CMD ["python", "temperature.py"]
