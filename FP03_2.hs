fPascal::Int->Int->Integer
fPascal _ 0 = 1
fPascal row col | row >= 0 && col >= 0 && row >= col = fPascal (row - 1) (col - 1) + fPascal (row - 1) (col)
  | otherwise = 0

fTriangle::Int->[[Integer]]
fTriangle a = reverse (fDreieck a)
  where
    fDreieck::Int->[[Integer]]
    fDreieck 0 = [[1]]
    fDreieck a = [fPascalRow a a] ++ fDreieck (a-1)
      where
        fPascalRow::Int->Int->[Integer]
        fPascalRow _ 0 = [1]
        fPascalRow a b = [fPascal a b] ++ fPascalRow a (b-1)


-- fPascal::Int->Int->Integer
-- fPascal _ 0 = 1
-- fPascl row col = iter row col 0 0
--   where
--     iter::Int->Int->Integer->Integer->Integer
--     iter _ 0 akk1 akk2 = akk1 + akk2
--     iter row col akk1 akk2 = iter row
