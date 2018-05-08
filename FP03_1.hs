module FP03_1 where

-- Squaresum
f_square_rek::Integer->Integer
f_square_rek 0 = 0
f_square_rek n = n * n + f_square_rek (n-1)

f_square_iter::Int->Int
f_square_iter n = f_iter n 0
  where
    f_iter::Int->Int->Int
    f_iter 0 akk = akk
    f_iter n akk = f_iter (n-1) (akk + n*n)

-- Fibonacci
f_fib_rek::Int->Integer
f_fib_rek 0 = 0
f_fib_rek 1 = 1
f_fib_rek n = f_fib_rek(n-1) + f_fib_rek(n-2)

f_fib_iter::Integer->Integer
f_fib_iter n = f_iter n 0 1
  where
    f_iter::Integer->Integer->Integer->Integer
    f_iter 0 akk1 _ = akk1
    f_iter 1 _ akk2 = akk2
    f_iter n akk1 akk2 = f_iter (n-1) akk2 (akk1+akk2)