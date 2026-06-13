# 📘 Mastering `bc` in Linux – From Basics to Advanced

## 🎯 Objective

Learn how to use the **`bc` (Basic Calculator)** command in Linux as:

* A calculator
* An algebra solver (step-by-step)
* A mini programming language (functions, loops, logic)

***

# 🧩 Part 1: Getting Started

### Start `bc` interactive mode

> [!TIP]
> Always start `bc` as `bc -l`

```bash
bc -l
```

You now have a REPL (Read–Eval–Print Loop) for math.

***

# 🧠 Part 2: Basic Expressions

### Examples

```
8 + 6
15 - 9
4 * 7
20 / 5
(6 + 4) * 3
```

✅ Concepts:

* Operator precedence (**BODMAS**).    What Does BODMAS Stand For? 
    * `B - Brackets`: Solve whatever is inside the brackets (parentheses) first.
    * `O - Orders / Of`: Calculate indices, powers, or square roots (e.g., 3², \(\sqrt{4}\)).
    * `D - Division & M - Multiplication`: Calculate these from left to right. They carry equal priority.
    * `A - Addition & S - Subtraction`: Calculate these from left to right. They carry equal priority. 
* Parentheses

***

# 🧠 Part 3: Powers & Order

```
3^3
10 + 2 * 5
(10 + 2) * 5
50 - 5^2
(8 + 2^3) * 2
```

✅ Concepts:

* Exponents (`^`)
* Expression evaluation order

***

# 🧠 Part 4: Variables (Algebra Mode)

```
x=5
x+7
```

### More examples

```
x=6
2*x+3

a=3
b=5
a*b + b

x=10
y=2
x/y + 4
```

✅ Concepts:

* Variables
* Expression reuse
* State in REPL

***

# 🧠 Part 5: Solving Equations (Manual Debugging)

👉 `bc` doesn’t auto-solve — you solve step-by-step.

### Example

Solve:

```
2x + 3 = 11
```

Rearrange:

```
(11 - 3) / 2
```

### Practice

```
(45 - 10) / 5
(21 + 14) / 7
```

✅ Concept:

> “Solving equations = debugging until x compiles successfully” 😄

***

# 🧠 Part 6: Decimals & Precision

```
scale=2
7/4
5/3
```

✅ Concept:

* `scale` controls decimal precision

***

# 🧠 Part 7: Advanced Expressions

```
2^5 + 3^4
(2^3 + 3^2)^2
5^3 - 4^3
```

***

# 🧠 Part 8: Stateful Computation (Multi-step)

```
x=5
y=2*x+3
y^2
```

```
a=4
b=3
(a+b)^3
```

```
x=6
y=2*x
z=y^2 + x
z
```

***

# 🧠 Part 9: Loops (Mini Programming)

## Sum of numbers

```
s=0
for(i=1;i<=5;i++) s=s+i
s
```

## Sum of squares

```
s=0
for(i=1;i<=4;i++) s=s+i^2
s
```

## Factorial

```
f=1
for(i=1;i<=5;i++) f=f*i
f
```

✅ Concepts:

* Iteration
* Accumulators

***

# 🧠 Part 10: Logic & Conditions

## Max of two numbers

```
a=12
b=8
if(a>b) a else b
```

## Even/Odd

```
x=17
x%2
```

## Absolute Value

```
x=-15
if(x<0) -x else x
```

✅ Concepts:

* Conditional expressions
* Basic decision-making

***

# 🚀 Part 11: Build a Function

## Problem

Solve:

```
ax + b = c
```

## Formula

```
x = (c - b) / a
```

***

## ✅ Basic Function

```bc
define solve(a, b, c) {
    return (c - b) / a
}
```

### Usage

```
solve(2, 4, 10)
```

***

## ✅ Improved Version (with validation)

```bc
define solve(a, b, c) {
    if (a == 0) {
        return -999
    }
    return (c - b) / a
}
```

***

## ✅ Pretty Output Version

```bc
define solve(a, b, c) {
    if (a == 0) {
        print "Error: a cannot be zero\n"
        return 0
    }
    x = (c - b) / a
    print "x = ", x, "\n"
    return x
}
```

### Usage

```
solve(4, 2, 18)
```

***

# 🧠 Mental Model (Engineer Mode)

Think of `bc` as:

```
bc = REPL + algebra engine + scripting language
```

### Mapping to your style:

| Concept         | Engineering Analogy |
| --------------- | ------------------- |
| Algebra solving | Debugging           |
| Expressions     | Pipelines           |
| Variables       | State               |
| Loops           | Iteration           |
| Functions       | Reusable APIs       |

***

# 🏁 Final Insight

You’ve progressed through:

1. ✅ Calculator usage
2. ✅ Algebra thinking
3. ✅ Stateful evaluation
4. ✅ Control flow
5. ✅ Function abstraction

👉 Essentially:

> You turned `bc` from a command into a **mini computational runtime**.

***

# 🔥 Next Level Ideas

If you want to extend further:

* Solve: `ax + b = cx + d`
* Quadratic solver: `ax² + bx + c = 0`
* Fibonacci generator
* Prime checker

***
