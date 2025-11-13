# راهنمای نصب و راه‌اندازی پروژه

<div dir="rtl">

## 📋 فهرست مطالب

1. [نصب وابستگی‌ها](#نصب-وابستگی‌ها)
2. [راه‌اندازی پروژه](#راه‌اندازی-پروژه)
3. [اجرای تست‌ها](#اجرای-تست‌ها)
4. [راه‌اندازی سرور مستندات](#راه‌اندازی-سرور-مستندات)
5. [استفاده از Docker](#استفاده-از-docker)
6. [Git و GitHub](#git-و-github)

</div>

## نصب وابستگی‌ها

### روش 1: استفاده از Docker (توصیه می‌شود)

```bash
# نصب Docker (اگر نصب نیست)
sudo apt-get update
sudo apt-get install docker.io

# ساخت Docker image
docker build -f Dockerfile.test -t ocaml-test .

# اجرای تست‌ها
docker run --rm ocaml-test
```

### روش 2: نصب محلی OCaml

#### Ubuntu/Debian:

```bash
# نصب وابستگی‌های پایه
sudo apt-get update
sudo apt-get install -y opam m4 build-essential

# راه‌اندازی opam
opam init --disable-sandboxing
eval $(opam env)

# نصب OCaml 4.14.1
opam switch create 4.14.1
opam switch 4.14.1

# نصب dune و کتابخانه‌های مورد نیاز
opam install dune num

# بررسی نصب
ocaml --version
dune --version
```

#### macOS:

```bash
# استفاده از Homebrew
brew install opam
opam init
eval $(opam env)
opam switch create 4.14.1
opam install dune num
```

## راه‌اندازی پروژه

```bash
# کلون کردن پروژه (یا اگر از قبل دارید)
cd Compiler-hw1

# Build پروژه
make

# یا برای development mode
make dev
```

## اجرای تست‌ها

```bash
# اجرای همه تست‌ها
make test

# یا مستقیماً
./oatc --test
```

### خروجی مورد انتظار:

```
Passed: 71/71
Failed: 0/71
Score: 64.0/64 (given)
```

## راه‌اندازی سرور مستندات

### روش 1: استفاده از اسکریپت

```bash
# اجرای سرور روی پورت 8000
./start-server.sh

# یا پورت دلخواه
./start-server.sh 8080
```

سپس در مرورگر به آدرس زیر بروید:
- `http://localhost:8000/DOCUMENTATION_FA.md`
- `http://localhost:8000/README.md`

### روش 2: استفاده از Python

```bash
# Python 3
python3 -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

### روش 3: استفاده از Docker Compose

```bash
# راه‌اندازی سرور
docker-compose up web-server

# یا در background
docker-compose up -d web-server
```

## استفاده از Docker

### Build و Test

```bash
# ساخت image
docker build -f Dockerfile.test -t ocaml-test .

# اجرای تست
docker run --rm ocaml-test

# اجرای interactive shell
docker run -it --rm ocaml-test /bin/bash
```

### Docker Compose

```bash
# اجرای تست‌ها
docker-compose up ocaml-test

# اجرای سرور مستندات
docker-compose up web-server

# اجرای هر دو
docker-compose up
```

## Git و GitHub

### راه‌اندازی Git Repository

```bash
# Initialize repository (اگر از قبل نیست)
git init

# اضافه کردن remote
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git

# یا با SSH
git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO.git
```

### Push به GitHub

```bash
# اضافه کردن فایل‌ها
git add .

# Commit
git commit -m "Initial commit: Complete OCaml HW1 implementation"

# Push به GitHub
git push -u origin main

# یا اگر branch شما master است
git push -u origin master
```

### ساخت Repository جدید در GitHub

1. به [GitHub](https://github.com) بروید
2. روی **New repository** کلیک کنید
3. نام repository را وارد کنید (مثلاً `ocaml-compiler-hw1`)
4. **Public** یا **Private** را انتخاب کنید
5. **Initialize with README** را تیک نزنید (چون ما از قبل README داریم)
6. روی **Create repository** کلیک کنید
7. دستورات نشان داده شده را اجرا کنید:

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

## استفاده از utop (Interactive OCaml)

```bash
# راه‌اندازی utop با ماژول‌های پروژه
make utop

# در utop:
# # open Hellocaml;;
# Hellocaml.cube 3;;
# - : int = 27
```

## عیب‌یابی (Troubleshooting)

### مشکل: `dune: command not found`

```bash
eval $(opam env)
opam install dune
```

### مشکل: `opam: command not found`

```bash
# Ubuntu/Debian
sudo apt-get install opam

# macOS
brew install opam
```

### مشکل: Docker permission denied

```bash
sudo usermod -aG docker $USER
# سپس logout و login کنید
```

### مشکل: Port 8000 already in use

```bash
# استفاده از پورت دیگر
./start-server.sh 8080

# یا پیدا کردن و kill کردن process
lsof -ti:8000 | xargs kill
```

## نکات مهم

1. **همیشه `eval $(opam env)` را اجرا کنید** بعد از نصب opam
2. **از Docker استفاده کنید** اگر نصب محلی مشکل دارد
3. **سرور مستندات را اجرا کنید** برای مشاهده راحت‌تر مستندات
4. **قبل از push، تست‌ها را اجرا کنید** تا مطمئن شوید همه چیز کار می‌کند

## منابع بیشتر

- [OCaml Documentation](https://ocaml.org/docs)
- [Dune Documentation](https://dune.readthedocs.io/)
- [Docker Documentation](https://docs.docker.com/)

---

<div dir="rtl">

**آخرین به‌روزرسانی**: 2024

</div>

