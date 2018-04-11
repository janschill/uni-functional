-- calculates the cross total of entered number
funcQuer::(Integral a, Ord a)=>a->a
funcQuer x | x < 10 = x
  | otherwise = (funcMod10 x) + funcQuer(div x 10)
  where
    funcMod10::(Integral a, Ord a)=>a->a
    funcMod10 x = mod x 10