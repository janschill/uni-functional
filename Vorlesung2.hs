-- Calculates faculty
fFaculty::Integer->Integer
fFaculty 0 = 1
fFaculty a = a * fFaculty (a-1)
-- -------------------------------

-- Takes two bools and returns True when both are True
fAnd::Bool->Bool->Bool
fAnd True True = True
fAnd True False = False
fAnd False True = False
fAnd False False = False

fAndWildCard::Bool->Bool->Bool
fAndWildCard True True = True
fAndWildCard _ _ = False
-- -------------------------------

-- Checks if first element of list of chars is an 'a'
fStartsWithA::[Char]->Bool
fStartsWithA ('a':xs) = True
fStartsWithA _ = False

fStartsWithACond::[Char]->Bool
fStartsWithACond [] = False
fStartsWithACond (x:_) | x == 'a' = True
  | otherwise = False
-- -------------------------------

-- Calculates the length of a list
fLength::[a]->Int
fLength [] = 0
fLength (_:xs) = 1 + fLength xs
-- -------------------------------
