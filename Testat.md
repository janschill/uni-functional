# Testat 1

## 1 – Data type
– `[]::[a]`
– `[1]::(Num a)=>[a]`
– `[1.2]::(Fractional a)=>[a]`
– `(<2)::(Num a, Ord a)=>a->Bool` oder `(<2)::Int->Bool`
– `let f = \x y -> x + y in f 1 2::Num a=>a`
– `(==)[(1.3,'a')] :: (Fractional a, Eq a) => [(a, Char)] -> Bool`
– `\x y -> x + y::Num a=>a->a->a`

## 2 – Data type function
```
f::(Num a)=>[a]->[a]
f [] = f[1]
f x = (\x -> x) x
```

## 3 – take_While function
```
take_while::(a->Bool)->[a]->[a]
take_while _ [] = []
take_while f (x:xs) | f x = sx ++ take_while f xs
      | otherwise = take_while f xs
```

## 4 – invert function
### recursive
```
f_invert::[a]->[a]
f_invert [] = []
f_invert (x:xs) = f_invert xs ++ [x]
```
### iterative

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