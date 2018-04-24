palindrom::[Integer]->[Integer]
palindrom [] = []
palindrom (x:xs) | isPalindrom x = x : palindrom xs
  | otherwise = palindrom xs
    where
      isPalindrom::Integer->Bool
      isPalindrom x = show x == reverse (show x)

take_while::(a->Bool)->[a]->[a]
take_while _ [] = []
take_while f (x:xs) | f x = [x] ++ take_while f xs
      | otherwise = take_while f xs

f_invert::[a]->[a]
f_invert [] = []
f_invert (x:xs) = f_invert xs ++ [x]