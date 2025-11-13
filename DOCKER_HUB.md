# Docker Hub Image

<div dir="rtl">

## استفاده از Docker Image از Docker Hub

</div>

## 🐳 Pull و Run

```bash
# Pull latest version
docker pull metasina3/ocaml-compiler-hw1:latest

# Run tests
docker run --rm metasina3/ocaml-compiler-hw1:latest

# Or with specific version
docker pull metasina3/ocaml-compiler-hw1:v1.0.0
docker run --rm metasina3/ocaml-compiler-hw1:v1.0.0
```

## 📦 Image Details

- **Repository**: `metasina3/ocaml-compiler-hw1`
- **Tags**: 
  - `latest` - Latest stable version
  - `v1.0.0` - Release version 1.0.0

## 🔗 Links

- **Docker Hub**: https://hub.docker.com/r/metasina3/ocaml-compiler-hw1
- **GitHub**: https://github.com/metasina3/ocaml-compiler-hw1

## 🚀 Quick Start

```bash
# One command to run all tests
docker run --rm metasina3/ocaml-compiler-hw1:latest
```

## 📋 What's Included

- ✅ OCaml 4.14.1
- ✅ Dune build system
- ✅ All project dependencies
- ✅ Complete source code
- ✅ All tests (71/71 passing)

## 🔧 Interactive Mode

```bash
# Run interactive shell
docker run -it --rm metasina3/ocaml-compiler-hw1:latest /bin/bash

# Then inside container:
eval $(opam env)
make utop
```

## 📊 Test Results

When you run the image, you'll see:

```
Passed: 71/71
Failed: 0/71
Score: 64.0/64 (given)
```

---

<div dir="rtl">

**برای اطلاعات بیشتر**: `README.md` را مطالعه کنید

</div>

