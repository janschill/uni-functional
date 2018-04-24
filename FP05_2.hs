module FP05_2 where

import Helper

{-
fibo =
  sum(takeWhile (< 4000000) fibo)
-}

f_fib_sum2::Integer
f_fib_sum2 = foldr (+) 0 (takeWhile (< four) (f_fibonacci_inf))

f_fibonacci_inf::[Integer]
f_fibonacci_inf = fib_inf 1
  where
    fib_inf::Integer->[Integer]
    fib_inf n = [f_fibonacci n] ++ fib_inf (n+1)

f_fibonacci_list::Integer->[Integer]
f_fibonacci_list n = reverse (f_fib_list n)
  where
    f_fib_list::Integer->[Integer]
    f_fib_list 0 = [0]
    f_fib_list n = [f_fibonacci n] ++ f_fib_list (n-1)

f_fib_sum::Integer->Integer
f_fib_sum n = foldr (+) 0 (f_fibonacci_list n)

four = 4000000

f_fib_sum_four::(Integer, Integer)
f_fib_sum_four = f_fib_inc 1
    where
      f_fib_inc::Integer->(Integer, Integer)
      f_fib_inc n | f_fib_sum n < four = f_fib_inc $ n+1
        | otherwise = ((f_fib_sum $ n-1), (n-1))