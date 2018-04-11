module FP04_4 where

import FP03_2

f_fak::Integer->Integer
f_fak n = iter n 1
  where
    iter::Integer->Integer->Integer
    iter 0 akk = akk
    iter n akk = iter (n-1) (n*akk)

f_binom::Integer->Integer->Integer
f_binom n k = div (f_fak n) ((f_fak k) * (f_fak (n-k)))

f_binom_triangle::Integer->[[Integer]]
f_binom_triangle a = reverse (f_triangle a)
  where
    f_triangle::Integer->[[Integer]]
    f_triangle 0 = [[1]]
    f_triangle a = [f_pascal_row a a] ++ f_triangle (a-1)
      where
        f_pascal_row::Integer->Integer->[Integer]
        f_pascal_row _ 0 = [1]
        f_pascal_row a b = [f_binom a b] ++ f_pascal_row a (b-1)