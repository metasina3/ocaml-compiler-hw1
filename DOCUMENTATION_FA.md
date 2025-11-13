# مستندات پروژه Hello OCaml - به زبان فارسی

## مقدمه

این پروژه یک تمرین آموزشی برای یادگیری زبان برنامه‌نویسی OCaml است. در این پروژه، شما با مفاهیم پایه‌ای OCaml، ساختارهای داده، توابع بازگشتی، و پیاده‌سازی یک مفسر ساده برای عبارات ریاضی آشنا می‌شوید.

## هدف پروژه

این پروژه **HW1: Hello OCaml** بخشی از درس **CIS341 (Compiler Design)** دانشگاه پنسیلوانیا است. هدف اصلی این پروژه:

### 1. یادگیری OCaml
- **هدف اصلی**: آشنایی با زبان برنامه‌نویسی OCaml که در ادامه درس برای ساخت کامپایلر استفاده می‌شود
- OCaml یک زبان functional programming است که به دلیل ویژگی‌های خاصش (type safety، pattern matching، immutability) برای پیاده‌سازی کامپایلرها مناسب است
- این پروژه محتوای 5 فصل اول کتاب "Introduction to Objective Caml" را پوشش می‌دهد

### 2. آماده‌سازی برای پروژه‌های بعدی
- **Tree Manipulation**: کار با درخت‌های داده (Abstract Syntax Trees) که در کامپایلرها بسیار استفاده می‌شوند
- **Recursive Programming**: یادگیری برنامه‌نویسی بازگشتی که برای پردازش درخت‌ها و ساختارهای بازگشتی ضروری است
- **Interpreter Development**: پیاده‌سازی یک مفسر ساده که پایه‌ای برای درک نحوه کار کامپایلرها است

### 3. آشنایی با Workflow پروژه
- یادگیری استفاده از **testing framework** که در تمام پروژه‌های بعدی استفاده می‌شود
- آشنایی با ساختار پروژه و نحوه build/test کردن
- یادگیری استفاده از **dune** (build system OCaml) و **utop** (interactive OCaml)

### 4. مفاهیم کلیدی کامپایلر
- **Object Language vs Meta Language**: درک تفاوت بین زبانی که می‌سازیم (object language) و زبانی که با آن می‌سازیم (meta language - OCaml)
- **Abstract Syntax Trees (AST)**: نمایش درختی از کد منبع
- **Interpretation**: ارزیابی عبارات در runtime
- **Optimization**: بهینه‌سازی کد در compile-time
- **Compilation**: تبدیل یک representation به representation دیگر (مثلاً از expression tree به stack-based code)

### 5. تمرین‌های عملی
پروژه شامل 5 بخش اصلی است که به تدریج از ساده به پیچیده می‌رود:
1. **Part 1**: مبانی OCaml (توابع، متغیرها، محاسبات ساده)
2. **Part 2**: Tuple ها، Generics، Pattern Matching
3. **Part 3**: لیست‌ها و بازگشت (Recursion)
4. **Part 4**: درخت‌های عبارت و مفسر (Expression Trees and Interpreters)
5. **Part 5**: کامپایل به زبان Stack-Based

### چرا OCaml برای کامپایلر؟
- **Type Safety**: جلوگیری از خطاهای runtime در compile-time
- **Pattern Matching**: ابزار قدرتمند برای پردازش AST
- **Immutability**: اطمینان از عدم تغییر ناخواسته داده‌ها
- **Functional Programming**: مناسب برای تبدیل‌های recursive روی درخت‌ها
- **Performance**: کامپایل به کد native با کارایی بالا

### نتیجه‌گیری
این پروژه یک **warm-up exercise** است که دانشجویان را برای پروژه‌های پیچیده‌تر کامپایلر آماده می‌کند. با تکمیل این پروژه، شما:
- با OCaml آشنا می‌شوید
- مهارت‌های لازم برای کار با درخت‌ها و بازگشت را کسب می‌کنید
- با مفاهیم پایه‌ای کامپایلر (interpreter، optimizer، compiler) آشنا می‌شوید
- آماده می‌شوید برای پروژه‌های بعدی که شامل lexer، parser، type checker و code generator هستند

## ساختار پروژه

پروژه شامل فایل اصلی `bin/hellocaml.ml` است که باید توابع مختلفی در آن پیاده‌سازی شوند. این توابع در 5 بخش اصلی تقسیم شده‌اند:

1. **Part 1**: مبانی OCaml
2. **Part 2**: Tuple ها، Generics، و Pattern Matching
3. **Part 3**: لیست‌ها و بازگشت (Recursion)
4. **Part 4**: درخت‌های عبارت و مفسر (Expression Trees and Interpreters)
5. **Part 5**: کامپایل به زبان Stack-Based

---

## Part 1: مبانی OCaml

### Problem 1-1: متغیر `pieces`

```ocaml
let pieces : int = 8
```

این متغیر باید مقدار 8 را داشته باشد تا تست‌ها پاس شوند.

### Problem 1-2: تابع `cube`

```ocaml
let cube (x : int) : int = x * x * x
```

این تابع مکعب یک عدد را محاسبه می‌کند. برای مثال:
- `cube 2` = 8
- `cube 0` = 0
- `cube (-1)` = -1

### Problem 1-2: تابع `cents_of`

```ocaml
let cents_of (q : int) (d : int) (n : int) (p : int) : int =
  q * 25 + d * 10 + n * 5 + p
```

این تابع تعداد سکه‌ها را می‌گیرد و مجموع ارزش آن‌ها را به سنت برمی‌گرداند:
- `q`: تعداد quarter (25 سنت)
- `d`: تعداد dime (10 سنت)
- `n`: تعداد nickel (5 سنت)
- `p`: تعداد penny (1 سنت)

### Problem 1-3: متغیرهای `prob3_*`

```ocaml
let prob3_ans : int = 17
let prob3_case2 (x : int) : int = prob3_ans - x
let prob3_case3 : int =
  let aux = prob3_case2 10 in
  double aux
```

این بخش برای تمرین با توابع و محاسبات است. `prob3_ans` باید 17 باشد تا تست‌ها پاس شوند.

---

## Part 2: Tuple ها، Generics، و Pattern Matching

### Problem 2-1: تابع `third_of_three`

```ocaml
let third_of_three (t : 'a * 'b * 'c) : 'c = match t with _, _, x -> x
```

این تابع عنصر سوم یک triple را برمی‌گرداند. از pattern matching استفاده می‌کند تا عناصر اول و دوم را نادیده بگیرد (`_`) و فقط عنصر سوم را استخراج کند.

**مثال:**
- `third_of_three (1, 2, 3)` = 3
- `third_of_three (true, "hello", 42)` = 42

### Problem 2-2: تابع `compose_pair`

```ocaml
let compose_pair (p : ('b -> 'c) * ('a -> 'b)) : 'a -> 'c =
  match p with (f, g) -> fun x -> f (g x)
```

این تابع دو تابع را ترکیب می‌کند (function composition). ابتدا `g` روی ورودی اعمال می‌شود، سپس `f` روی نتیجه اعمال می‌شود.

**مثال:**
- اگر `f(x) = x + 1` و `g(x) = x * 2` باشد، `compose_pair (f, g)` تابعی است که `x` را می‌گیرد و `(x * 2) + 1` را برمی‌گرداند.

---

## Part 3: لیست‌ها و بازگشت (Recursion)

### Problem 3-1: تابع `list_to_mylist`

```ocaml
let rec list_to_mylist (l : 'a list) : 'a mylist =
  match l with
  | [] -> Nil
  | h :: tl -> Cons (h, list_to_mylist tl)
```

این تابع یک لیست built-in OCaml را به نوع `mylist` که خودمان تعریف کرده‌ایم تبدیل می‌کند. از بازگشت استفاده می‌کند:
- اگر لیست خالی باشد، `Nil` برمی‌گرداند
- در غیر این صورت، عنصر اول را با `Cons` به ابتدای لیست تبدیل شده اضافه می‌کند

### Problem 3-2: تابع `append`

```ocaml
let rec append (l1 : 'a list) (l2 : 'a list) : 'a list =
  match l1 with
  | [] -> l2
  | h :: tl -> h :: append tl l2
```

این تابع دو لیست را به هم متصل می‌کند:
- اگر `l1` خالی باشد، `l2` را برمی‌گرداند
- در غیر این صورت، عنصر اول `l1` را به ابتدای نتیجه `append` بقیه `l1` با `l2` اضافه می‌کند

**مثال:**
- `append [1; 2] [3; 4]` = `[1; 2; 3; 4]`

### Problem 3-3: تابع `rev`

```ocaml
let rec rev (l : 'a list) : 'a list =
  match l with
  | [] -> []
  | h :: tl -> append (rev tl) [h]
```

این تابع یک لیست را معکوس می‌کند:
- لیست خالی معکوس خودش است
- برای لیست غیرخالی، ابتدا tail را معکوس می‌کند، سپس head را به انتهای آن اضافه می‌کند

**مثال:**
- `rev [1; 2; 3]` = `[3; 2; 1]`

### Problem 3-4: تابع `rev_t` (Tail Recursive)

```ocaml
let rev_t (l : 'a list) : 'a list =
  let rec rev_helper (acc : 'a list) (lst : 'a list) : 'a list =
    match lst with
    | [] -> acc
    | h :: tl -> rev_helper (h :: acc) tl
  in
  rev_helper [] l
```

این نسخه tail-recursive از `rev` است. در tail recursion، آخرین عملیات تابع، فراخوانی بازگشتی خودش است. این باعث می‌شود کامپایلر OCaml آن را به یک حلقه تبدیل کند که کارایی بهتری دارد.

**تفاوت با `rev`:**
- `rev` از stack زیادی استفاده می‌کند (O(n) stack space)
- `rev_t` از accumulator استفاده می‌کند و فقط O(1) stack space نیاز دارد

### Problem 3-5: تابع `insert`

```ocaml
let rec insert (x : 'a) (l : 'a list) : 'a list =
  match l with
  | [] -> [x]
  | h :: tl ->
      if x = h then l
      else if x < h then x :: l
      else h :: insert x tl
```

این تابع یک عنصر را در یک لیست مرتب شده درج می‌کند:
- اگر لیست خالی باشد، لیست `[x]` را برمی‌گرداند
- اگر `x` برابر با head باشد، لیست را بدون تغییر برمی‌گرداند (برای جلوگیری از تکرار)
- اگر `x` کوچکتر از head باشد، `x` را در ابتدای لیست قرار می‌دهد
- در غیر این صورت، `x` را در tail درج می‌کند

**مثال:**
- `insert 2 [1; 3]` = `[1; 2; 3]`
- `insert 1 [1; 2]` = `[1; 2]` (تکرار نمی‌شود)

### Problem 3-6: تابع `union`

```ocaml
let rec union (l1 : 'a list) (l2 : 'a list) : 'a list =
  match l1 with
  | [] -> l2
  | h :: tl -> union tl (insert h l2)
```

این تابع دو لیست مرتب شده را با هم ترکیب می‌کند و یک لیست مرتب شده بدون تکرار برمی‌گرداند:
- اگر `l1` خالی باشد، `l2` را برمی‌گرداند
- در غیر این صورت، عناصر `l1` را یکی یکی در `l2` درج می‌کند (با استفاده از `insert`)

**مثال:**
- `union [1; 3] [2; 4]` = `[1; 2; 3; 4]`
- `union [1; 2] [2; 3]` = `[1; 2; 3]` (تکرار حذف می‌شود)

---

## Part 4: درخت‌های عبارت و مفسر

### نوع داده `exp`

```ocaml
type exp =
  | Var of string
  | Const of int64
  | Add of exp * exp
  | Mult of exp * exp
  | Neg of exp
```

این یک نوع داده بازگشتی است که عبارات ریاضی را نشان می‌دهد:
- `Var "x"`: یک متغیر
- `Const 5L`: یک ثابت (عدد 64 بیتی)
- `Add (e1, e2)`: جمع دو عبارت
- `Mult (e1, e2)`: ضرب دو عبارت
- `Neg e1`: منفی کردن یک عبارت

**مثال:**
- `Mult (Const 2L, Const 3L)` نشان‌دهنده `2 * 3` است
- `Add (Var "x", Const 1L)` نشان‌دهنده `x + 1` است

### Problem 4-1: تابع `vars_of`

```ocaml
let rec vars_of (e : exp) : string list =
  match e with
  | Var x -> [x]
  | Const _ -> []
  | Add (e1, e2) -> union (vars_of e1) (vars_of e2)
  | Mult (e1, e2) -> union (vars_of e1) (vars_of e2)
  | Neg e1 -> vars_of e1
```

این تابع تمام متغیرهای موجود در یک عبارت را پیدا می‌کند و به صورت لیست مرتب شده و بدون تکرار برمی‌گرداند:
- برای `Var x`، فقط `[x]` را برمی‌گرداند
- برای `Const`، لیست خالی برمی‌گرداند
- برای عملیات‌های دوتایی، متغیرهای هر دو زیرعبارت را با `union` ترکیب می‌کند
- برای `Neg`، متغیرهای زیرعبارت را برمی‌گرداند

**مثال:**
- `vars_of (Mult (Const 2L, Const 3L))` = `[]`
- `vars_of (Add (Var "x", Const 1L))` = `["x"]`
- `vars_of (Mult (Var "y", Add (Var "x", Const 1L)))` = `["x"; "y"]`

### نوع داده `ctxt`

```ocaml
type ctxt = (string * int64) list
```

این یک "evaluation context" است که متغیرها را به مقادیرشان نگاشت می‌کند. به صورت یک لیست از جفت‌های (نام متغیر، مقدار) نمایش داده می‌شود.

**مثال:**
- `[("x", 3L)]`: متغیر `x` را به 3 نگاشت می‌کند
- `[("x", 2L); ("y", 7L)]`: `x` را به 2 و `y` را به 7 نگاشت می‌کند

### Problem 4-2: تابع `lookup`

```ocaml
let rec lookup (x : string) (c : ctxt) : int64 =
  match c with
  | [] -> raise Not_found
  | (key, value) :: tl -> if key = x then value else lookup x tl
```

این تابع مقدار یک متغیر را در context پیدا می‌کند:
- اگر context خالی باشد، exception `Not_found` را raise می‌کند
- اگر اولین binding با نام متغیر مطابقت داشته باشد، مقدار آن را برمی‌گرداند
- در غیر این صورت، در بقیه context جستجو می‌کند

**نکته مهم:** اگر چند binding برای یک متغیر وجود داشته باشد، اولین مورد (نزدیک‌ترین به ابتدای لیست) استفاده می‌شود.

**مثال:**
- `lookup "x" [("x", 3L)]` = `3L`
- `lookup "x" [("x", 1L); ("x", 2L)]` = `1L` (اولین مورد)
- `lookup "y" [("x", 3L)]` → `Not_found` exception

### Problem 4-3: تابع `interpret`

```ocaml
let rec interpret (c : ctxt) (e : exp) : int64 =
  match e with
  | Var x -> lookup x c
  | Const n -> n
  | Add (e1, e2) -> Int64.add (interpret c e1) (interpret c e2)
  | Mult (e1, e2) -> Int64.mul (interpret c e1) (interpret c e2)
  | Neg e1 -> Int64.neg (interpret c e1)
```

این تابع یک مفسر (interpreter) است که یک عبارت را در یک context ارزیابی می‌کند:
- `Var x`: مقدار متغیر را از context می‌خواند
- `Const n`: خود عدد را برمی‌گرداند
- `Add (e1, e2)`: ابتدا هر دو زیرعبارت را ارزیابی می‌کند، سپس آن‌ها را جمع می‌زند
- `Mult (e1, e2)`: ابتدا هر دو زیرعبارت را ارزیابی می‌کند، سپس آن‌ها را ضرب می‌کند
- `Neg e1`: ابتدا زیرعبارت را ارزیابی می‌کند، سپس منفی آن را برمی‌گرداند

**مثال:**
- `interpret [("x", 3L)] (Mult (Const 2L, Const 3L))` = `6L`
- `interpret [("x", 3L)] (Add (Var "x", Const 1L))` = `4L`
- `interpret [("x", 3L)] (Mult (Var "y", Const 1L))` → `Not_found` (چون `y` در context نیست)

### Problem 4-4: تابع `optimize`

```ocaml
let rec optimize (e : exp) : exp =
  match e with
  | Var x -> Var x
  | Const n -> Const n
  | Add (e1, e2) -> (
      let e1' = optimize e1 in
      let e2' = optimize e2 in
      match (e1', e2') with
      | Const 0L, e -> e
      | e, Const 0L -> e
      | Const n1, Const n2 -> Const (Int64.add n1 n2)
      | _ -> Add (e1', e2'))
  | Mult (e1, e2) -> (
      let e1' = optimize e1 in
      let e2' = optimize e2 in
      match (e1', e2') with
      | Const 0L, _ -> Const 0L
      | _, Const 0L -> Const 0L
      | Const 1L, e -> e
      | e, Const 1L -> e
      | Const n1, Const n2 -> Const (Int64.mul n1 n2)
      | _ -> Mult (e1', e2'))
  | Neg e1 -> (
      let e1' = optimize e1 in
      match e1' with
      | Const n -> Const (Int64.neg n)
      | Neg e2 -> e2
      | _ -> Neg e1')
```

این تابع یک بهینه‌ساز (optimizer) است که عبارات را ساده می‌کند:

**قوانین بهینه‌سازی:**

1. **برای `Add`:**
   - `Add (Const 0L, e)` → `e` (جمع با صفر)
   - `Add (e, Const 0L)` → `e`
   - `Add (Const n1, Const n2)` → `Const (n1 + n2)` (محاسبه در compile-time)

2. **برای `Mult`:**
   - `Mult (Const 0L, _)` → `Const 0L` (ضرب در صفر)
   - `Mult (_, Const 0L)` → `Const 0L`
   - `Mult (Const 1L, e)` → `e` (ضرب در یک)
   - `Mult (e, Const 1L)` → `e`
   - `Mult (Const n1, Const n2)` → `Const (n1 * n2)` (محاسبه در compile-time)

3. **برای `Neg`:**
   - `Neg (Const n)` → `Const (-n)` (منفی کردن ثابت)
   - `Neg (Neg e)` → `e` (منفی منفی = مثبت)

**مثال:**
- `optimize (Add (Const 3L, Const 4L))` = `Const 7L`
- `optimize (Mult (Const 0L, Var "x"))` = `Const 0L`
- `optimize (Add (Const 3L, Mult (Const 0L, Var "x")))` = `Const 3L`
- `optimize (Neg (Neg (Var "x")))` = `Var "x"`

---

## Part 5: کامپایل به زبان Stack-Based

### نوع داده `insn` و `program`

```ocaml
type insn =
  | IPushC of int64
  | IPushV of string
  | IMul
  | IAdd
  | INeg

type program = insn list
```

این یک زبان برنامه‌نویسی stack-based است (مثل Reverse Polish Notation):
- `IPushC n`: عدد `n` را روی stack می‌گذارد
- `IPushV x`: مقدار متغیر `x` را از context می‌خواند و روی stack می‌گذارد
- `IMul`: دو عدد از بالای stack را برمی‌دارد، ضرب می‌کند، و نتیجه را روی stack می‌گذارد
- `IAdd`: دو عدد از بالای stack را برمی‌دارد، جمع می‌زند، و نتیجه را روی stack می‌گذارد
- `INeg`: یک عدد از بالای stack را برمی‌دارد، منفی می‌کند، و نتیجه را روی stack می‌گذارد

**مثال:**
- برنامه `[IPushC 2L; IPushC 3L; IMul]` محاسبه `2 * 3` را انجام می‌دهد:
  1. `2` روی stack می‌رود: `[2]`
  2. `3` روی stack می‌رود: `[3, 2]`
  3. `IMul` دو عدد را برمی‌دارد و `6` را روی stack می‌گذارد: `[6]`

### Problem 5: تابع `compile`

```ocaml
let rec compile (e : exp) : program =
  match e with
  | Var x -> [IPushV x]
  | Const n -> [IPushC n]
  | Add (e1, e2) -> append (compile e1) (append (compile e2) [IAdd])
  | Mult (e1, e2) -> append (compile e1) (append (compile e2) [IMul])
  | Neg e1 -> append (compile e1) [INeg]
```

این تابع یک عبارت `exp` را به یک برنامه stack-based تبدیل می‌کند:

**الگوریتم:**
1. `Var x`: دستور `IPushV x` را تولید می‌کند
2. `Const n`: دستور `IPushC n` را تولید می‌کند
3. `Add (e1, e2)`: 
   - ابتدا `e1` را کامپایل می‌کند (مقدار `e1` روی stack می‌رود)
   - سپس `e2` را کامپایل می‌کند (مقدار `e2` روی stack می‌رود)
   - در نهایت `IAdd` را اضافه می‌کند (دو مقدار را جمع می‌کند)
4. `Mult (e1, e2)`: مشابه `Add` اما با `IMul`
5. `Neg e1`: ابتدا `e1` را کامپایل می‌کند، سپس `INeg` را اضافه می‌کند

**مثال:**
- `compile (Mult (Const 2L, Const 3L))` = `[IPushC 2L; IPushC 3L; IMul]`
- `compile (Add (Var "x", Const 1L))` = `[IPushV "x"; IPushC 1L; IAdd]`
- `compile (Neg (Add (Const 2L, Const 3L)))` = `[IPushC 2L; IPushC 3L; IAdd; INeg]`

**نکته:** ترتیب کامپایل مهم است. برای `Add (e1, e2)`، ابتدا `e1` کامپایل می‌شود، سپس `e2`، و در نهایت `IAdd`. این باعث می‌شود که هنگام اجرا، ابتدا `e1` ارزیابی شود و روی stack برود، سپس `e2` ارزیابی شود و روی stack برود، و در نهایت `IAdd` آن‌ها را جمع کند.

---

## مفاهیم کلیدی OCaml

### 1. Pattern Matching

Pattern matching یکی از قوی‌ترین ویژگی‌های OCaml است. به شما اجازه می‌دهد ساختار داده‌ها را به راحتی تجزیه کنید:

```ocaml
match l with
| [] -> "empty"
| [x] -> "one element"
| x :: y :: tl -> "at least two elements"
```

### 2. Recursion

OCaml از بازگشت (recursion) به جای حلقه‌ها استفاده می‌کند. برای کارایی بهتر، از tail recursion استفاده کنید:

```ocaml
(* Not tail recursive *)
let rec sum l = match l with [] -> 0 | h :: tl -> h + sum tl

(* Tail recursive *)
let sum l =
  let rec helper acc = function
    | [] -> acc
    | h :: tl -> helper (acc + h) tl
  in
  helper 0 l
```

### 3. Type Inference

OCaml نوع‌ها را به صورت خودکار استنتاج می‌کند، اما بهتر است type annotation اضافه کنید:

```ocaml
let add (x : int) (y : int) : int = x + y
```

### 4. Immutability

در OCaml، متغیرها immutable هستند. وقتی یک مقدار را به یک متغیر اختصاص می‌دهید، نمی‌توانید آن را تغییر دهید:

```ocaml
let x = 5
(* x همیشه 5 است - نمی‌توانید x = 6 بنویسید *)
```

### 5. Functional Programming

OCaml یک زبان functional است. توابع first-class هستند و می‌توانید آن‌ها را به عنوان آرگومان بفرستید یا از توابع برگردانید:

```ocaml
let apply_twice f x = f (f x)
let double x = x * 2
apply_twice double 3  (* = 12 *)
```

---

## نحوه اجرای پروژه

1. **کامپایل پروژه:**
   ```bash
   make
   ```

2. **اجرای تست‌ها:**
   ```bash
   make test
   ```

3. **شروع utop (interactive OCaml):**
   ```bash
   make utop
   ```

4. **پاک کردن فایل‌های کامپایل شده:**
   ```bash
   make clean
   ```

---

## خلاصه توابع پیاده‌سازی شده

| بخش | تابع | توضیح |
|-----|------|-------|
| Part 1 | `pieces` | متغیر با مقدار 8 |
| Part 1 | `cube` | محاسبه مکعب یک عدد |
| Part 1 | `cents_of` | محاسبه ارزش سکه‌ها |
| Part 2 | `third_of_three` | استخراج عنصر سوم از triple |
| Part 2 | `compose_pair` | ترکیب دو تابع |
| Part 3 | `list_to_mylist` | تبدیل لیست به mylist |
| Part 3 | `append` | اتصال دو لیست |
| Part 3 | `rev` | معکوس کردن لیست |
| Part 3 | `rev_t` | معکوس کردن لیست (tail recursive) |
| Part 3 | `insert` | درج عنصر در لیست مرتب |
| Part 3 | `union` | ترکیب دو لیست مرتب |
| Part 4 | `vars_of` | استخراج متغیرهای یک عبارت |
| Part 4 | `lookup` | جستجوی مقدار متغیر در context |
| Part 4 | `interpret` | ارزیابی یک عبارت |
| Part 4 | `optimize` | بهینه‌سازی یک عبارت |
| Part 5 | `compile` | کامپایل عبارت به برنامه stack-based |

---

## نکات مهم

1. **همه توابع باید type annotation داشته باشند** - این به کامپایلر کمک می‌کند خطاهای بهتری نشان دهد.

2. **از pattern matching استفاده کنید** - این روش استاندارد OCaml برای کار با داده‌ها است.

3. **Tail recursion را در نظر بگیرید** - برای توابع بازگشتی که روی لیست‌های بزرگ کار می‌کنند.

4. **Exception handling** - برای `lookup` و `interpret`، اگر متغیری پیدا نشود، `Not_found` exception raise می‌شود.

5. **تست کنید** - همیشه کد خود را با `make test` تست کنید تا مطمئن شوید همه چیز درست کار می‌کند.

---

## منابع بیشتر

- [OCaml Documentation](https://ocaml.org/docs)
- [Introduction to Objective Caml](https://caml.inria.fr/pub/docs/oreilly-book/)
- [OCaml Standard Library](https://v2.ocaml.org/api/)

---

---

## نتایج Build و Test

### وضعیت Build

پروژه با موفقیت build شد و هیچ خطای کامپایلی وجود ندارد. برای build و test کردن پروژه می‌توانید از Docker استفاده کنید:

```bash
# ساخت Docker image
docker build -f Dockerfile.test -t ocaml-test .

# اجرای تست‌ها
docker run --rm ocaml-test
```

یا اگر OCaml و dune نصب دارید:

```bash
cd Compiler-hw1
make test
```

### نتایج Test

**همه تست‌ها با موفقیت پاس شدند!**

```
Passed: 71/71
Failed: 0/71
Score: 64.0/64 (given)
       ?/36 (hidden)
```

### جزئیات تست‌های پاس شده

#### Part 1: مبانی OCaml
- ✅ **Problem1-1** (3/3 points): 5/5 تست پاس
  - `pieces` = 8
  - `cube` برای اعداد مختلف
  
- ✅ **Problem1-2** (3/3 points): 7/7 تست پاس
  - `cents_of` برای ترکیبات مختلف سکه‌ها
  
- ✅ **Problem1-3** (Student Tests): پاس
  - تست‌های student-provided

#### Part 2: Tuple ها و Pattern Matching
- ✅ **Problem2-1** (3/3 points): 3/3 تست پاس
  - `third_of_three` برای انواع مختلف tuple
  
- ✅ **Problem2-2** (5/5 points): 3/3 تست پاس
  - `compose_pair` برای ترکیب توابع

#### Part 3: لیست‌ها و بازگشت
- ✅ **Problem3-1** (5/5 points): 4/4 تست پاس
  - `list_to_mylist` برای تبدیل لیست‌ها
  
- ✅ **Problem3-2** (5/5 points): 7/7 تست پاس
  - `append` برای اتصال لیست‌ها
  
- ✅ **Problem3-3** (5/5 points): 5/5 تست پاس
  - `rev` برای معکوس کردن لیست‌ها
  
- ✅ **Problem3-4** (5/5 points): 5/5 تست پاس
  - `rev_t` (tail-recursive version)
  
- ✅ **Problem3-5** (5/5 points): 6/6 تست پاس
  - `insert` برای درج در لیست مرتب
  
- ✅ **Problem3-6** (5/5 points): 8/8 تست پاس
  - `union` برای ترکیب دو لیست مرتب

#### Part 4: Expression Trees و Interpreter
- ✅ **Problem4-1** (5/5 points): 3/3 تست پاس
  - `vars_of` برای استخراج متغیرها
  
- ✅ **Problem4-2** (5/5 points): 5/5 تست پاس
  - `lookup` برای جستجوی متغیرها در context
  
- ✅ **Problem4-3** (5/5 points): 3/3 تست پاس
  - `interpret` برای ارزیابی عبارات
  
- ✅ **Problem4-4** (5/5 points): 3/3 تست پاس
  - `optimize` برای بهینه‌سازی عبارات

#### Part 5: کامپایل
- ✅ **Problem5**: تست‌های hidden (نیاز به بررسی دستی)

### خلاصه نمرات

| بخش | نمره Visible | وضعیت |
|-----|--------------|-------|
| Part 1 | 9/9 | ✅ کامل |
| Part 2 | 8/8 | ✅ کامل |
| Part 3 | 30/30 | ✅ کامل |
| Part 4 | 20/20 | ✅ کامل |
| Part 5 | ?/5 | ⏳ Hidden |
| **جمع** | **64/64** | ✅ **100%** |

### تست‌های Hidden

تست‌های hidden که نیاز به بررسی دستی دارند:
- Problem1-3 (3 points)
- Problem2-1Manual (3 points) - بررسی type annotations
- Problem3-4Manual (5 points) - بررسی tail recursion
- Problem4-3harder (5 points)
- Problem4-4harder (5 points)
- Problem4-4hardest (5 points)
- Problem5 (5 points)
- StyleManual (5 points)

**جمع نمرات hidden: 36 points**

### نتیجه‌گیری

✅ **پروژه با موفقیت کامل شد!**
- همه توابع پیاده‌سازی شده‌اند
- Build موفقیت‌آمیز بود
- 71 تست از 71 تست پاس شدند
- نمره visible: 64/64 (100%)
- پروژه آماده ارسال است

---

**نویسنده:** این مستندات برای پروژه Hello OCaml تهیه شده است.

**تاریخ:** 2024

