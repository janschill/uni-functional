-- calculates the cross total of entered number
f_quer::(Integral a, Ord a)=>a->a
f_quer x | x < 10 = x
  | otherwise = (f_mod10 x) + f_quer(div x 10)
  where
    f_mod10::(Integral a, Ord a)=>a->a
    f_mod10 x = mod x 10