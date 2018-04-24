module FP05_4 where

import Helper
import Data.Char

powerNumber = f_power 1000 2

f_sum_digit_sum::Integer
f_sum_digit_sum =
  let
    num2List = map (digitToInt) (show powerNumber)
    solution = toInteger $ foldl (+) 0 num2List
  in
    solution