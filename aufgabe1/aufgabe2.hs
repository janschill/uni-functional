-- calculates the cross total of entered number
funcQuer x | x < 10 = x
  | otherwise = (funcMod10 x) + funcQuer(div x 10)
  where funcMod10 x = mod x 10