module Helper where

f_filter::(Integer->Bool)->[Integer]->[Integer]
f_filter f [] = []
f_filter f (x:xs) | f x = x : f_filter f xs
  | otherwise = f_filter f xs

f_qsort::[Integer]->[Integer]
f_qsort [] = []
f_qsort (x:xs) = f_qsort smaller ++ [x] ++ f_qsort larger
  where
    smaller = f_filter (<= x) xs
    larger = f_filter (> x) xs

-- Fast doubling
f_fibonacci :: Integer -> Integer
f_fibonacci n | n >= 0 = fst (f_fib n)
    where
      f_fib :: Integer -> (Integer, Integer)
      f_fib 0 = (0, 1)
      f_fib n =
        let
          (a, b) = f_fib (div n 2)
          c = a * (b * 2 - a)
          d = a * a + b * b
        in if mod n 2 == 0 then (c, d) else (d, c + d)

f_power::Integer->Integer->Integer
f_power 0 _ = 1
f_power power base = f_iter base power 1
  where
    f_iter::Integer->Integer->Integer->Integer
    f_iter n 0 akk = akk
    f_iter n m akk = f_iter n (m-1) (akk*n)

f_sum::Integer->Integer
f_sum n = div (n*(n+1)) 2

f_sum'::Integer->Integer
f_sum' n = f_add_sum 0 n
 where
  f_add_sum::Integer->Integer->Integer
  f_add_sum m 0 = m
  f_add_sum m n = f_add_sum (m+n) (n-1)

f_sum''::Integer->Integer
f_sum'' 0 = 0
f_sum'' n = n + f_sum''(n-1)