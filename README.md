# functional

Functional programming with Haskell for university class

1. [pros and cons](#pros-and-cons)
    <!-- 1. [pro](#pro)
    2. [con](#con) -->
2. [syntax](#syntax)
    <!-- 1. [function names](#function-names)
    2. [parameters](#parameters)
    3. [body](#body)
    4. [operators](#operators) -->
3. [local functions](#local-functions)
4. [multiple-conditions](#multiple-conditions)
5. [types](#types)
    <!-- 1. [standard types](#standard-types)
    2. [type-annotation](#type-annotation)
        1. [Figure1](#Figure-1:-Predefined-Type-Classes-in-Haskell) -->
6. [lists and tupel](#lists-and-tupel)
    <!-- 1. [lists](#lists)
    2. [tupel](#tupel)
        1. [type](#type)
        2. [number-of-elements](#number-of-elements) -->
7. [pattern-matching](#pattern-matching)
    <!-- 1. [pattern](#pattern)
        1. [constant](#constant)
        2. [variable](#variable)
        3. [tupel](#tupel)
        4. [wildcard-_](#wildcard-_)
        5. [list](#list) -->
8. [recursion](#recursion)
    <!-- 1. [linear](#linear)
    2. [tree](#tree)
    3. [nested](#nested)
    4. [reciprocal](#reciprocal)
        1. [accumulator-technique](#accumulator-technique) -->
9. [lazy-evaluation](#lazy-evaluation)
10. [partial-application](#partial-application)
11. [higher-order-functions](#higher-order-functions)
12. [lambda-(anonymous-function)](#lambda-(anonymous-function))
13. [polymorphism](#polymorphism)
14. [list-comprehension](#list-comprehension)
15. [example-programs](#example-programs)

## pros and cons

### pro

- compact source code
- guarentees same results for same parameters
- slim functions
  - simplifies testing
  - due to compactness shortens time developing

### con

- recursive overhead can get out of control

## syntax

`f p1 p2 p3 pn = body`

### function names

- letters
- digits
- has to start with lower case letter
- allowed symbols: _ and '

_eg._

- `func x = x + 1`
- `fun' x = x + 2`
- `fun_ x = x + 3`
- `fun1 x = x + 4`

### parameters

- constants
- variables
- functions
- lists
- tupel

### body

- constants
- variables
- function calls
- case analysis
- mathematical operations

### operators

- `-` subtraction
- `+` addition
- `/` division
- `mod` modulo
- `^` exponent
- `<` smaller than
- `>` greater than
- `<=` smaller equal than
- `>=` greater equal than
- `==` equal
- `/=` not equal
- `&&` and
- `||` or
- `not` not

## local functions

- `where`

_eg._

```haskell
f x y = x + f' y
  where
    f' n = n + n
```

- `let in`

```haskell
f x y =
  let
    f' n = n + n
  in
    x + f' y
```

## multiple conditions (guards)

```haskell
f p1 p2 … pn | condition1 = expression1
             | condition2 = expression2
             | conditionn = expressionn
             | otherwise  = expression
```

## types

### standard types

- `Bool`: `True`, `False`
- `Char`: `'a'`, `'1'`
- `Int`: 4 Byte
- `Integer`: _unlimited_
- `Float`:
- `Double`: double precision
- `String`: `"abs"` list of Chars

### type annotation

#### Figure 1: Predefined Type Classes in Haskell

![Haskell Type Classes](https://www.haskell.org/onlinereport/classes.gif)

_Source:_ [Haskell.org](https://www.haskell.org/onlinereport/basic.html)

_eg._

```haskell
add::(Num a)=>a->a->a
```

_use_ `:t name` _to ask compiler for type_

## lists and tupel

### lists

1. comma seperated
   - `[1,2,3]` or `[1..3]`
   - `[[1,2],[3]]`
   - `['t', 'e', 's', 't']`
2. _first element : rest of list_
   - `1:[2,3]`
   - `1:2:[3]`
   - `1:2:3:[]`

### tupel

_eg._
`(1,2,"abc", 3)::(Int, Int, String, Int)`
`[1,2], True, 'x')::([Int], Bool, Char)`

#### type

(T1, T2, T3,… , Tn)

#### number of elements

arity {arity = 2 pair, arity = 3 triple, arity = 1 not possible}

## pattern matching

```haskell
f::T1->T2->Tn->Treturn
f p1 p2 pn = expression1
f q1 q2 qn = expression2
f r1 r2 rn = expressionn
```

_eg._

```haskell
f::(a, a)->[a]->[a]
f (x,y) [] = []
f (x,y) (a:ab) = x : (a:ab)
```

### pattern

#### 1. constant

```haskell
f_Not::Bool->Bool
f_Not True = False
f_Not False = True
```

#### 2. variable

```haskell
f_faculty::Integer->Integer
f_faculty 0 = 1
f_faculty x = x * f_faculty (x-1)
```

#### 3. tupel

```haskell
firstElement::(a,a)->a
firstElement (x,y) = x
```

#### 4. wildcard _

```haskell
firstElement::(a,a)->a
firstElement (x,_) = x
```

```haskell
and::Bool->Bool->Bool
and True True = True
and True False = False
and False True = False
and False False = False

and::Bool->Bool->Bool
and True True = True
and _ _ = False
```

A Wildcard (_) does not get evaluated and the compiler jumps straight to the function body.

#### 5. list

```haskell
startsWithA::[Char]->Bool
startsWithA [] = False
startsWithA ('a':_) = True
startsWithA _ = False
```

## recursion

### 1. linear

`f (x) + 1 + f (x-1)`

### 2. tree

`f (x) = f (x-1) + f (x-1)`

### 3. nested

`f (x,y) = f (f (x,0)), y-1`

### 4. reciprocal

`f (x) = g (x-1), g (x) = f (x-1)`

#### accumulator technique

Recursions of the type _2–4_ can cause high stack consumption. To prevent this we motivate a way to use the _accumulator_ technique.

_eg._

We will show the stack consumption of a simple faculty linear recursion function using *term replacements*.

```haskell
f_fak 0 = 1
f_fak n = n * f_fak (n-1)
```

```haskell
> f_fak 3
  = 3 * (f_fak (3-1))
  = 3 * (f_fak 2)
  = 3 * (2 * f_fak (2-1))
  = 3 * (2 * f_fak 1)
  = 3 * (2 * (1 * f_fak (1-1)))
  = 3 * (2 * (1 * f_fak 0))
  = 3 * (2 * (1 * 1))
  = 3 * (2 * 1)
  = 3 * 2
  = 6
```

```haskell
f_iter 0 akk = 1
f_iter n akk = f_iter (n-1) (akk*n)
```

```haskell
> f_iter 3 1
  = f_iter 2 (1*3)
  = f_iter 1 (1*3*2)
```

## lazy evaluation

## partial application

```haskell
ink::Int->Int
ink x = x + 1

add::Int->Int->Int
add x y = x + y

(add 1)::Int->Int
ink = add 1

mult::Int->Int->Int->Int
mult x y z = x * y * z

mult 2 3 4::Int->Int->Int->Int
(mult 2)::Int->Int->Int
(mult 2 3)::Int->Int
```

In Haskell function types are *right* associative and function calls are *left* associative.

## higher order functions

Functions that either take a function as a *parameter* or *return* a function.

```haskell
times2::[Int]->[Int]
times2 [] = []
times2 (x:xs) = 2 * x : times2 (xs)

square::[Int]->[Int]
square [] = []
square (x:xs) = x * x : square (xs)

mapList::(Int->Int)->[Int]->[Int]
mapList f [] = []
mapList f (x:xs) = f x : mapList f xs

mapList (*2) [1,2,3]
mapList (\x -> x*2) [1,2,3]
```

## lambda (anonymous function)

`\argument -> body`

```haskell
(\x -> x + 1)
(\x y -> x + y)
(\x -> \y -> x + y)
```

## polymorphism

## list comprehension

```haskell
natural = [1,2,3,..]
        = [x | x <- [1..]]

squares = [1,4,9,16]
        = [x^2 | x <- [1..]]
```

[Expression | Generators]

- there can be multiple generators
- left associative
- variables of expression are bound to a value through a generator

_eg._

```haskell
[(x,y) | x <- [1,2,3], y <-[4,5]

[(1,4), (1,5), (2,4), (2,5), (3,4), (3,5)]
```

List comprehension can also take logical expressions

[Expression | Generators, Logical expression]

Generator:

- pattern <- expression
- local definition with _let_ (without _in_)

## evaluation

`f p1 p2 … pn = body (expression)`

- at function call parameters get bound to arguments
- replaces function call with right side of equation

### strategies

1. call-by-value (inside to outside, most imperative languages)
    - before function gets applied, all arguments have to be evaluated

_eg._
`f(2+5)` -> `f 7`

2. call-by-name (outside to inside, most functional languages)
    - before arguments are evaluated, function gets applied
    - if arguments need to be evaluated, the get evaluated after (lazy loading)

_eg._

1. multiplication

```haskell
mult::(Int, Int)->Int
mult (x,y) = x * y
```

*call-by-value:*

```haskell
> mult (1+2, 3+4)
= mult (3, 3+4)
= mult (3, 7)
= 3 * 7
= 21
```

*call-by-name:*

```haskell
> mult (1+2, 3+4)
= (1+2) * (3+4)
= 3 * (3+4)
= 3 * 7
= 21
```

2. infinity

```haskell
infinity::[Int]
infinity 1 : infinity
```

*call-by-value:*

```haskell
> head infinity
= head (1:infinity)
= head (1:1:infinity)
= …
```

*call-by-name:*

```haskell
> head infinity
= head (1:infinity)
= 1
```

3. lambda calculation

*call-by-value:*

```haskell
> (\x -> mult x x) (1+2)
= (\x -> mult x x) 3
= mult 3 3
= 3 * 3
= 9
```

*call-by-name:*

```haskell
> (\x -> mult x x) (1+2)
= mult (1+2) (1+2)
= (1+2) * (1+2)
= 3 * (1+2)
= 3 * 3
= 9
```

*drawback* for _call-by-name_ x gets evaluated a second time, even though in theory we already know the solution

### sharing

compiler checks at argument binding for repeated calls and creates pointer to physical memory

_eg._

```haskell
> (\x -> mult x x) (1+2)
= mult . . {1+2}
= . * . {1+2}
= . * . {3}
= 9
```

_call-by-name_ + _sharing_ = _call-by-need_

## types and data

### type declaration

- new name (only for readability)
- can have parameters
- cannot be recursively declared
- name begins with capitalized letter

_eg._

```haskell
f::[Int]->[Int]

type Numbers = [Int]

f::Numbers->Numbers
```

```haskell
f::(a,b)->a

type Paar a b = (a,b)

f::(Paar a b)->a
```

### data declaration

- a whole new type with corresponding values
- can have parameters
- can be recursively
- name begins with capitalized letter

_eg._
```haskell
data Bool = True | False

data Month = Jan | Feb | Mar | … | Dec
```

#### constructor

- name begins with capitalized letter
- without parameters called _value constructor_
- with parameters called _function constructor_
- usuage as: pattern argument, return
- same constructor names cannot be defined in one module

_eg._

```haskell
data Form = Circle Double | Rectanle Double Double

f::Form->Double
f (Circle r) = pi * r ^ 2
f (Rectangle l w) = l * w
```

```haskell
>:t Circle
= Circle::Double->Form
```

#### type maybe

```haskell
data Maybe a = Just a | Nothing
```

checks if a calculation was successful or not

_eg._

```haskell
divide::Int->Int->Maybe Int
divide n 0 = Nothing
divide n m = Just (div n m)

divPossible::Int->Int->Bool
divPossible n m = case (divide n m) of
                Just _ = True
                Nothing = False
```

a function with two different return types

```haskell
data Either a b = Left a | Right b
```

_eg._
```haskell
divide n 0 = Left "0 division"
divide n m = Right (div n m)
```


## example programs

### 1.recusion

#### sum of all numbers between a given range

```haskell
sum x y | x <= y = x + sum (x+1) y
        | otherwise = 0
```

#### concat first element of tupel to list

```haskell
f::(Int, Int)->[Int]->[Int]
f (x,y) list = x : list

```

#### length of list function

```haskell
f::[a]->Int
f [] = 0
f (_:xs) = 1 + f xs
```

### 2.iterative-recursion

tail recursive

#### implementation of length function

```haskell
length'::[a]->Int
length' l = iter l 0
  where
    iter::[a]->Int->Int
    iter [] akk = akk
    iter (x:xs) akk = iter xs (akk+1)
```

### 3.higher-order-functions

#### filter a list

```haskell
filterList::(Int->Bool)->[Int]->[Int]
filterList f [] = []
filterList f (x:xs) | f x = x : filterList f xs
                    | otherwise = filterList f xs
```

#### quicksort

```haskell
quicksort::[Int]->[Int]
quicksort [] = []
quicksort (x:xs) = quicksort smaller ++ [x] ++ quicksort larger
  where
    smaller = filterList (<=x) xs
    larger  = filterList (>x) xs
```

### 4.list-comprehension

#### list all pairs of [1,2,3]

```haskell
[(x,y) | x <-[1,2,3], y <-[x..3]]
```

#### define the concat function (f::[[a]]->[a])

```haskell
f::[[a]]->[a]
f lists = [x | list <- lists, x <- list]
```

#### even numbers smaller than 100

```haskell
l::[Int]
l = [x | x <- [1..99], mod x 2 == 0]
```

#### prime numbers

```haskell
primeNumber::Int->[Int]
primeNumber n = [x | x <- [2..n], isPrime x]

isPrime::Int->Bool
isPrime n = factors n == [1,n]

factors::Int->[Int]
factors n = [x | x <- [1..n], mod n x == 0]
```

### 5.evaluation

```haskell
f x = x + x
g x = 2 * x
```

*call-by-value*

```haskell
> f (g 3)
= f (2 * 3)
= f 6
= 6 + 6
= 12
```

*call-by-name*

```haskell
> f (g 3)
= (g 3) + (g 3)
= (2 + 3) + (g 3)
= (2 + 3) + (2 + 3)
= 6 + (2 + 3)
= 6 + 6
= 12
```

*call-by-need*

```haskell
> f (g 3)
= . + . {g 3}
= . + . {2*3}
= . + . {6}
= 12
```

### 6.types

#### data type list

```haskell
data List a = Nil | Cons a (List a)
```

#### length of data list

```haskell
f::List->Int
f Nil = 0
f (Cons a l) = 1 + f l
```
