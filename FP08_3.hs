f_power'::Integer->Integer->Integer
f_power' base 0 = 1
f_power' base power = base * f_power' base (power - 1)

f_power::Integer->Integer->Integer
f_power base 0 = 1
f_power base power | mod power 2 == 0 =
  let
    x = f_power base (div power 2)
  in (x * x)
  | otherwise = base * f_power base (power - 1)

f_power_iter::Integer->Integer->Integer
f_power_iter _ 0 = 1
f_power_iter base power = f_iter base power 1
  where
    f_iter::Integer->Integer->Integer->Integer
    f_iter base 0 akk = akk
    f_iter base power akk | mod power 2 == 0 =
      let
        x = f_iter base (div power 2) akk
      in
        (x * x)
      | otherwise = f_iter base (power-1) (akk*base)


{-
> f_power 2 2

= f_power 2 (div 2 2) * f_power 2 (div 2 2)
= f_power 2 1 * f_power 2 1
= 2 * f_power 2 (1-1) * 2 * f_power 2 (1-1)
= 2 * f_power 2 0 * 2 * f_power 2 0
= 2 * 1 * 2 * 1
= 4
-}

{-
> f_power 3 3

= 3 * f_power 3 (3-1)
= 3 * f_power 3 2
= 3 * f_power 3 (div 2 2) * f_power 3 (div 2 2)
= 3 * f_power 3 1 * f_power 3 1
= 3 * 3 * f_power 3 (1-1) * 3 * f_power 3 (1-1)
= 3 * 3 * f_power 3 0 * 3 * f_power 3 0
= 3 * 3 * 1 * 3 * 1
= 27
-}

{-
> f_power_iter 2 2

= f_iter 2 2 1
= f_iter 2 (2-1) (1*2)
= f_iter 2 1 (1*2)
= f_iter 2 1 2
= f_iter 2 (1-1) (2*2)
= f_iter 2 0 (2*2)
= f_iter 2 0 4
= 4
-}

{-
> f_power_iter 3 3

= f_iter 3 3 1
= f_iter 3 (3-1) (1*3)
= f_iter 3 2 (1*3)
= f_iter 3 2 3
= f_iter 3 (2-1) (3*3)
= f_iter 3 1 (3*3)
= f_iter 3 1 9
= f_iter 3 (1-1) (3*9)
= f_iter 3 0 (3*9)
= f_iter 3 0 27
= 27
-}