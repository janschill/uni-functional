palindrom::[Integer]->[Integer]
palindrom [] = []
palindrom (x:xs) | isPalindrom x = x : palindrom xs
  | otherwise = palindrom xs
    where
      isPalindrom::Integer->Bool
      isPalindrom x = show x == reverse (show x)