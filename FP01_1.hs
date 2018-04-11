-- calculates the median of the range of two numbers

funcMedian::(Fractional a, Ord a)=>a->a->a
funcMedian x y = funcDivPlus1 (funcSumOfRange x y) x y
  where
    -- returns the quotient of par1 divided by the number numbers between y and x
    funcDivPlus1::(Fractional a, Ord a)=>a->a->a->a
    funcDivPlus1 a x y = a / (y - x + 1)

    -- returns the sum of the range of two numbers
    funcSumOfRange::(Fractional a, Ord a)=>a->a->a
    funcSumOfRange x y | x <= y = x + funcSumOfRange (x+1) y
      | otherwise = 0
