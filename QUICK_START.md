# 🚀 Quick Start Guide

<div dir="rtl">

## شروع سریع پروژه

</div>

## ⚡ 5 دقیقه تا اجرای پروژه

### 1️⃣ Clone یا Download

```bash
# اگر از GitHub clone می‌کنید
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO

# یا اگر فایل ZIP دارید
unzip project.zip
cd Compiler-hw1
```

### 2️⃣ با Docker (ساده‌ترین روش)

```bash
# Build و Test
docker build -f Dockerfile.test -t ocaml-test .
docker run --rm ocaml-test
```

**✅ تمام!** اگر همه تست‌ها پاس شدند، پروژه کار می‌کند.

### 3️⃣ راه‌اندازی سرور مستندات

```bash
# اجرای سرور
./start-server.sh

# باز کردن در مرورگر
# http://localhost:8000/DOCUMENTATION_FA.md
```

## 📋 دستورات مفید

```bash
# Build پروژه
make

# اجرای تست‌ها
make test

# Development mode (watch)
make dev

# Interactive OCaml
make utop

# راه‌اندازی سرور
./start-server.sh

# Clean
make clean
```

## 🐳 Docker Compose

```bash
# همه چیز با یک دستور
docker-compose up

# فقط تست‌ها
docker-compose up ocaml-test

# فقط سرور
docker-compose up web-server
```

## 📚 مستندات

- **README.md**: راهنمای کامل انگلیسی
- **DOCUMENTATION_FA.md**: مستندات کامل فارسی
- **SETUP.md**: راهنمای نصب و راه‌اندازی
- **PUSH_TO_GITHUB.md**: راهنمای push به GitHub

## ✅ بررسی سریع

```bash
# آیا همه چیز کار می‌کند؟
make test

# خروجی باید باشد:
# Passed: 71/71
# Score: 64.0/64
```

## 🆘 مشکل دارید؟

1. **Docker نصب نیست؟** → از `SETUP.md` استفاده کنید
2. **تست‌ها fail می‌شوند؟** → `make clean && make test`
3. **سرور کار نمی‌کند؟** → `python3 -m http.server 8000`

---

<div dir="rtl">

**برای اطلاعات بیشتر**: `SETUP.md` را مطالعه کنید

</div>

