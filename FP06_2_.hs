module FP06_2_ where

import Prelude hiding (foldr)

intList = [1..10]
intList2 = [[1..3],[4..7],[8..9]]

{- use foldr to construct following functions -}
filter'::(a->Bool)->[a]->[a]
filter' _ [] = []
filter' f (x:xs) = foldr (\x xs -> if f x then [x] ++ xs else xs ) [] (x:xs)

map'::(a->b)->[a]->[b]
map' _ [] = []
map' f (x:xs) = foldr (\x xs -> [f x] ++ xs) [] (x:xs)

concat'::[[a]]->[a]
concat' [] = []
concat' (x:xs) = foldr (\x xs -> x ++ xs) [] (x:xs)

{- implementation help
takes a function, a neutral element and a list
applies the function to the first element with its rest recursively

eg.:
foldr (+) 0 [1..5]
> 15
-}
foldr::(a->b->b)->b->[a]->b
foldr _ element [] = element
foldr fun element (x:xs) = fun x (foldr fun element xs)

