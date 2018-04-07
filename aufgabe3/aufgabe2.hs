fPascal::Integer->Integer->Integer
fPascal 0 0 = 1
fPascal row col | row >= 0 && col >= 0 = fPascal (row - 1) (col - 1) + fPascal (row - 1) (col)
  | otherwise = 0

fDreieck::Integer->[[Integer]]
fDreieck 0 = [[1]]
fDreieck a = [[fPascal a a] ++ [fPascal (a - 1) (a - 1)]]