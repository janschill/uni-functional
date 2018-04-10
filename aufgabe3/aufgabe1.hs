-- Squaresum
f_rek::Integer->Integer
f_rek 0 = 0
f_rek n = n * n + f_rek (n-1)

f_iter::Int->Int
f_iter n = iter n 0
  where
    iter::Int->Int->Int
    iter 0 akk = akk
    iter n akk = iter (n-1) (akk + n*n)

-- Fibonacci
fib_rek::Int->Integer
fib_rek 0 = 0
fib_rek 1 = 1
fib_rek n = fib_rek(n-1) + fib_rek(n-2)

fib_iter::Integer->Integer
fib_iter 0 = 0
fib_iter 1 = 1
fib_iter n = iter n 0 1
  where
    iter::Integer->Integer->Integer->Integer
    iter 0 akk1 _ = akk1
    iter 1 _ akk2 = akk2
    iter n akk1 akk2 = iter (n-1) akk2 (akk1+akk2)
