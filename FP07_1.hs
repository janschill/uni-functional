module FP07_1 where

-- list_a::[[Int]]
list lists = [x | list <- lists, x <- list]

{- [[10], [9], [8], [7], [6], [5], [4], [3], [2], [1]] -}
list_a::[[Int]]
list_a = reverse [[x] | x <- [1..10]]

{- [[5,6,7], [5,6,7,8,9], [5,6,7,8,9,10,11], [5,6,7,8,9,10,11,12,13]] -}
f_list_b::[[Integer]]
f_list_b = f_list_b' 4
  where
    f_list_b'::Integer->[[Integer]]
    f_list_b' n | n <= 10 = [x+4 | x <- [1..10], x < n] : f_list_b' (n+2)
                | otherwise = []

{-
x<4
x<6
x<8
x<10

123
12345
1234567
123456789
-}