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