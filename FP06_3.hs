module FP06_3 where

{- removes repetition in a list -}

intList = [1,2,3,3,3,4,6,6,7]

filterRepetition::(Eq a)=>[a]->[a]
filterRepetition (x:xs) = foldr (\x xs -> if (notElem x xs) then [x] ++ xs else xs) [] (x:xs)

