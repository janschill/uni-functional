module FP03_2 where

f_pascal::Int->Int->Integer
f_pascal _ 0 = 1
f_pascal row col | row >= 0 && col >= 0 && row >= col = f_pascal (row - 1) (col - 1) + f_pascal (row - 1) (col)
  | otherwise = 0

f_triangle::Int->[[Integer]]
f_triangle a = reverse (f_iter a)
  where
    f_iter::Int->[[Integer]]
    f_iter 0 = [[1]]
    f_iter a = [f_pascal_row a a] ++ f_iter (a-1)
      where
        f_pascal_row::Int->Int->[Integer]
        f_pascal_row _ 0 = [1]
        f_pascal_row a b = [f_pascal a b] ++ f_pascal_row a (b-1)


-- fPascal::Int->Int->Integer
-- fPascal _ 0 = 1
-- fPascal row col = iter row col 0 0
--   where
--     iter::Int->Int->Integer->Integer->Integer
--     iter _ 0 akk1 akk2 = akk1 + akk2
--     iter row col akk1 akk2 = iter row
