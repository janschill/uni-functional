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
`func x = x + 1`
`fun' x = x + 2`
`fun_ x = x + 3`
`fun1 x = x + 4`

### parameters

- constants
- variables
- functions

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

## lazy evaluation

## higher order functions

## partial application

## polymorphism

## example programs

### sum of all numbers between a given range

```haskell
sum x y | x <= y = x + sum (x+1) y
        | otherwise = 0
```