module FP01_1 where

-- calculates the median of the range of two numbers

f_median::(Fractional a, Ord a)=>a->a->a
f_median x y = f_div_plus1 (f_sum_of_range x y) x y
  where
    -- returns the quotient of par1 divided by the number numbers between y and x
    f_div_plus1::(Fractional a, Ord a)=>a->a->a->a
    f_div_plus1 a x y = a / (y - x + 1)

    -- returns the sum of the range of two numbers
    f_sum_of_range::(Fractional a, Ord a)=>a->a->a
    f_sum_of_range x y | x <= y = x + f_sum_of_range (x+1) y
      | otherwise = 0
