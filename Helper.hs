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