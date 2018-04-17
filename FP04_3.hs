import Prelude hiding (foldr)

{-
  Haskell function just implemented to show functionality
  Receives a function, which returns a list. This function takes two arguments, an element and a list and returns a list,
  depending on the function provided it uses the function on the first element on the list and calls itself with the same function on the remaining list
-}
foldr::(a->b->b)->b->[a]->b
foldr _ element [] = element
foldr fun element (x:xs) = fun x (foldr fun element xs)

{-
  Takes a function (bool condition) and returns with the help of foldr the filtered list by the provided conditional function
-}
f_filter::(Integer->Bool)->[Integer]->[Integer]
f_filter f [] = []
f_filter f (x:xs) = foldr (\x xs -> if f x then [x] ++ xs else xs) [] (x:xs)