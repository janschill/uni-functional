module FP02_5 where

fib::Integer->Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + (n-2)

fibList::Integer->[Integer]
fibList 0 = []
fibList n = fibList (n-1) ++ [fib n]