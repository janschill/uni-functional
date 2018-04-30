{- removes repetition in a list -}

intList = [1,2,3,3,3,4,6,6,7]

filterRepeatition::(Eq a)=>[a]->[a]
filterRepeatition (x:xs) = foldr (\x xs -> if not (elem x xs) then [x] ++ xs else xs) [] (x:xs)