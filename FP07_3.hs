module FP07_3 where

{-
use list comprehension to implement map and filter function
-}

intList = [1..5]

map'::(a->b)->[a]->[b]
map' _ [] = []
map' f (x:xs) = f x : map' f [n | n <- xs]

map''::(a->b)->[a]->[b]
map'' _ [] = []
map'' f xxs = [f x | x <- xxs]

filter'::(a->Bool)->[a]->[a]
filter' f xs = [n | n <- xs, f n]