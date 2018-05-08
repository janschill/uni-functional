module FP06_2 where

f_not_multiple::Integer->Integer->Bool
f_not_multiple multiple num = mod num multiple /= 0

f_prime_list::Integer->[Integer]
f_prime_list n = f_sieve [2..n]
  where
    f_sieve::[Integer]->[Integer]
    f_sieve [] = []
    f_sieve (x:xs) = x : f_sieve [y | y <- xs, f_not_multiple x y]
