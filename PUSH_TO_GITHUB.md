# راهنمای Push به GitHub

<div dir="rtl">

## مراحل Push کردن پروژه به GitHub

</div>

## Step 1: ساخت Repository در GitHub

1. به [GitHub.com](https://github.com) بروید و login کنید
2. روی **+** (بالا سمت راست) کلیک کنید
3. **New repository** را انتخاب کنید
4. اطلاعات را وارد کنید:
   - **Repository name**: `ocaml-compiler-hw1` (یا نام دلخواه)
   - **Description**: `CIS341 HW1 - Hello OCaml - Complete implementation with all tests passing`
   - **Visibility**: Public یا Private (انتخاب شما)
   - **Initialize repository**: ❌ تیک نزنید (چون ما از قبل فایل‌ها را داریم)
5. روی **Create repository** کلیک کنید

## Step 2: اضافه کردن Remote

بعد از ساخت repository، GitHub یک URL به شما می‌دهد. یکی از این دو روش را استفاده کنید:

### روش 1: HTTPS (ساده‌تر)

```bash
cd /root/ml/Compiler-hw1

# اضافه کردن remote
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# بررسی
git remote -v
```

### روش 2: SSH (امن‌تر)

```bash
cd /root/ml/Compiler-hw1

# اضافه کردن remote با SSH
git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git

# بررسی
git remote -v
```

**نکته**: برای SSH باید SSH key را به GitHub اضافه کرده باشید.

## Step 3: تغییر نام Branch (اختیاری)

```bash
# تغییر از master به main (اگر می‌خواهید)
git branch -M main
```

## Step 4: Push کردن

```bash
# Push به GitHub
git push -u origin main

# یا اگر branch شما master است
git push -u origin master
```

### اگر با خطا مواجه شدید:

#### خطا: Authentication failed

```bash
# برای HTTPS: از Personal Access Token استفاده کنید
# 1. GitHub → Settings → Developer settings → Personal access tokens
# 2. Generate new token
# 3. هنگام push، username و token را وارد کنید

git push -u origin main
# Username: YOUR_USERNAME
# Password: YOUR_TOKEN (نه password!)
```

#### خطا: Permission denied (SSH)

```bash
# بررسی SSH key
ssh -T git@github.com

# اگر کار نکرد، SSH key بسازید:
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
# سپس public key را به GitHub اضافه کنید
```

## Step 5: بررسی

بعد از push موفق، به صفحه repository در GitHub بروید و بررسی کنید:
- ✅ همه فایل‌ها آپلود شده‌اند
- ✅ README.md نمایش داده می‌شود
- ✅ DOCUMENTATION_FA.md موجود است

## دستورات کامل (Copy-Paste Ready)

```bash
# 1. بروید به پوشه پروژه
cd /root/ml/Compiler-hw1

# 2. بررسی وضعیت
git status

# 3. اضافه کردن remote (YOUR_USERNAME و YOUR_REPO را جایگزین کنید)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git

# 4. تغییر branch به main (اختیاری)
git branch -M main

# 5. Push
git push -u origin main
```

## دستورات برای به‌روزرسانی‌های بعدی

```bash
# بعد از تغییرات:
git add .
git commit -m "Description of changes"
git push
```

## ساخت Release (اختیاری)

برای ساخت یک release در GitHub:

1. به صفحه repository بروید
2. روی **Releases** کلیک کنید
3. **Create a new release** را بزنید
4. اطلاعات را وارد کنید:
   - **Tag**: `v1.0.0`
   - **Title**: `Complete Implementation - All Tests Passing`
   - **Description**: 
     ```
     ✅ All 71 tests passing
     ✅ Complete implementation
     ✅ Full documentation (English & Persian)
     ✅ Docker support
     ✅ Web server for documentation
     ```

## نکات مهم

1. **هرگز فایل‌های حساس را commit نکنید** (passwords, API keys, etc.)
2. **قبل از push، تست‌ها را اجرا کنید**: `make test`
3. **Commit messages را واضح بنویسید**
4. **از .gitignore استفاده کنید** (از قبل تنظیم شده)

## مشکلات رایج

### Repository از قبل وجود دارد

```bash
# اگر remote از قبل اضافه شده:
git remote set-url origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
```

### فایل‌های اضافی commit شده

```bash
# حذف از staging (نه از disk)
git reset HEAD <file>

# یا همه را unstage کنید
git reset
```

### Push rejected

```bash
# اگر repository از قبل فایل دارد:
git pull origin main --allow-unrelated-histories
# سپس دوباره push کنید
```

---

<div dir="rtl">

**موفق باشید! 🚀**

</div>

