# Testat 1

## 1 – Datentypen
– `[]::[a]`
– `[1]::(Num a)=>[a]`
– `[1.2]::(Fractional a)=>[a]`
– `(<2)::(Num a, Ord a)=>a->Bool` oder `(<2)::Int->Bool`
– `let f = \x y -> x + y in f 1 2::Num a=>a`
– `(==)[(1.3,'a')] :: (Fractional a, Eq a) => [(a, Char)] -> Bool`
– `\x y -> x + y::Num a=>a->a->a`
```
f::(Num a)=>[a]->[a]
f [] = f[1]
f x = (\x -> x) x
```

## 5 - Palindrom
```
palindrom::[Integer]->[Integer]
palindrom [] = []
palindrom (x:xs) | isPalindrom x = x : palindrom xs
  | otherwise = palindrom xs
    where
      isPalindrom::Integer->Bool
      isPalindrom x = show x == reverse (show x)
```