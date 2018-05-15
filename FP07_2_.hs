module FP07_2_ where

import Helper

{-
nth fibonacci numbers using list comprehension

0,1,1,2,3,5,8,13,…
-}

f_fib_list::Integer->[Integer]
f_fib_list n = [x | x <- [1..n]]


-- f_fib_iter::Integer->Integer
-- f_fib_iter n = f_iter n 0 1
--   where
--     f_iter::Integer->Integer->Integer->Integer
--     f_iter 0 akk1 _ = akk1
--     f_iter 1 _ akk2 = akk2
--     f_iter n akk1 akk2 = f_iter (n-1) akk2 (akk1+akk2)