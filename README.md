# functional

Functional programming with Haskell for university class

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

## type

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
2. first element : rest of list
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
natural = [1,2,3]
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
f lists = [x | list <- lists, x <- lists]
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