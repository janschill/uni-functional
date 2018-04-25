module FP05_3 where

{-
Insertion sort iterates over a list of to be sorted items and alaywas compares the current item with the rest of the already sorted list
[3,2,5,1,4] - 2
[2,3,5,1,4] - 3
[2,3,5,1,4] - 5
[2,3,5,1,4] - 1
[2,3,1,5,4] - 1
[2,1,3,5,4] - 1
[1,2,3,5,4] - 1
[1,2,3,5,4] - 4
[1,2,3,4,5] - 4
-}
f_insertion_sort::[Integer]->[Integer]
f_insertion_sort (x:xs) | length xs < 1 = [x]
  | otherwise = f_sort (x:xs)
    where
      f_sort::[Integer]->[Integer]
      f_sort (x:xs) = x + f_sort xs


f_insertion_sort (x:xs) = filter ()
  where
    f_sort::[Integer]->[Integer]->[Integer]
    f_sort (x:xs) (y:ys) =


