# 🐳 OCaml Compiler HW1 - Docker Hub

<div dir="rtl">

## استفاده از Docker Image از Docker Hub

این image شامل تمام وابستگی‌ها و کد پروژه است و آماده استفاده می‌باشد.

</div>

## 📦 Quick Start

```bash
# Pull و run تست‌ها
docker run --rm metasina3/ocaml-compiler-hw1:latest
```

این دستور:
1. Image را از Docker Hub pull می‌کند
2. تمام تست‌ها را اجرا می‌کند
3. نتایج را نمایش می‌دهد

## 🏷️ Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable version |
| `v1.0.0` | Release version 1.0.0 |

## 🚀 Usage Examples

### Run Tests

```bash
# Latest version
docker run --rm metasina3/ocaml-compiler-hw1:latest

# Specific version
docker run --rm metasina3/ocaml-compiler-hw1:v1.0.0
```

### Interactive Shell

```bash
# Start interactive shell
docker run -it --rm metasina3/ocaml-compiler-hw1:latest /bin/bash

# Inside container:
eval $(opam env)
make utop
# یا
cd /workspace
make test
```

### Mount Local Directory (Development)

```bash
# Mount current directory for development
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  metasina3/ocaml-compiler-hw1:latest \
  /bin/bash
```

### Using Docker Compose

```bash
# Run tests
docker-compose up ocaml-test

# Run specific version
docker-compose up ocaml-test-versioned

# Interactive shell
docker-compose run ocaml-interactive

# Web server for documentation
docker-compose up web-server
```

## 📋 What's Included

این image شامل:

- ✅ **OCaml 4.14.1** - کامپایلر OCaml
- ✅ **Dune 3.20.2** - Build system
- ✅ **Num library** - کتابخانه اعداد
- ✅ **Complete source code** - تمام کد پروژه
- ✅ **All dependencies** - تمام وابستگی‌ها
- ✅ **Test framework** - فریمورک تست

## 📊 Expected Output

وقتی image را اجرا می‌کنید، باید خروجی زیر را ببینید:

```
dune build
./oatc --test

Student-Provided Tests For Problem 1-3:
  OK
Problem1-1 (3/3 points = 5/5 tests):
  OK
Problem1-2 (3/3 points = 7/7 tests):
  OK
...
---------------------------------------------------
Passed: 71/71
Failed: 0/71
Score: 64.0/64 (given)
       ?/36 (hidden)
```

## 🔧 Advanced Usage

### Build Project

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  metasina3/ocaml-compiler-hw1:latest \
  sh -c "eval \$(opam env) && make"
```

### Run Specific Test

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  metasina3/ocaml-compiler-hw1:latest \
  sh -c "eval \$(opam env) && ./oatc --test"
```

### Start utop (Interactive OCaml)

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  metasina3/ocaml-compiler-hw1:latest \
  sh -c "eval \$(opam env) && make utop"
```

## 🐳 Docker Compose Services

### ocaml-test
اجرای تست‌ها با latest version

```bash
docker-compose up ocaml-test
```

### ocaml-test-versioned
اجرای تست‌ها با version مشخص (v1.0.0)

```bash
docker-compose up ocaml-test-versioned
```

### ocaml-interactive
شل تعاملی برای توسعه

```bash
docker-compose run ocaml-interactive
```

### web-server
سرور وب برای مستندات (پورت 8000)

```bash
docker-compose up web-server
# سپس به http://localhost:8000 بروید
```

## 📚 Project Structure in Container

```
/workspace/
├── bin/
│   ├── hellocaml.ml      # Main implementation
│   └── main.ml           # Entry point
├── test/
│   ├── gradedtests.ml    # Graded tests
│   └── studenttests.ml   # Student tests
├── lib/
│   └── util/             # Utility libraries
├── DOCUMENTATION_FA.md   # Persian documentation
├── README.md             # Main README
└── Makefile              # Build automation
```

## 🔗 Links

- **Docker Hub**: https://hub.docker.com/r/metasina3/ocaml-compiler-hw1
- **GitHub Repository**: https://github.com/metasina3/ocaml-compiler-hw1
- **GitHub Release**: https://github.com/metasina3/ocaml-compiler-hw1/releases/tag/v1.0.0

## 📖 Documentation

- **README.md**: راهنمای کامل پروژه
- **DOCUMENTATION_FA.md**: مستندات فارسی کامل
- **SETUP.md**: راهنمای نصب و راه‌اندازی
- **QUICK_START.md**: راهنمای شروع سریع

## 🛠️ Troubleshooting

### Image not found

```bash
# Pull image manually
docker pull metasina3/ocaml-compiler-hw1:latest
```

### Permission denied

```bash
# Run with sudo (if needed)
sudo docker run --rm metasina3/ocaml-compiler-hw1:latest
```

### Port already in use

```bash
# Use different port in docker-compose.yml
ports:
  - "8080:8000"  # Instead of 8000:8000
```

## 📝 Notes

- Image size: ~984MB
- Base image: Ubuntu 20.04
- OCaml version: 4.14.1
- All tests passing: 71/71 ✅

## 🎯 Use Cases

1. **Quick Testing**: بدون نیاز به نصب OCaml
2. **CI/CD**: استفاده در pipeline های خودکار
3. **Development**: محیط یکسان برای همه
4. **Teaching**: نمایش سریع پروژه
5. **Portability**: اجرا در هر جایی که Docker دارد

---

<div dir="rtl">

**برای اطلاعات بیشتر**: به [README.md](README.md) و [DOCUMENTATION_FA.md](DOCUMENTATION_FA.md) مراجعه کنید.

</div>

**Last Updated**: 2024  
**Maintained by**: metasina3

