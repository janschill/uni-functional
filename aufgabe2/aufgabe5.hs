fFibNumber::Integer->Integer
fFibNumber 0 = 0
fFibNumber 1 = 1
fFibNumber a = fFibNumber(a-1) + fFibNumber(a-2)

fFibList::Integer->[Integer]
fFibList 0 = [0]
fFibList a = [fFibNumber a] ++ fFibList (a-1)

-- Internet Fibonacci calculations

-- List version
fib n = fibs 0 1 !! n
  where
    fibs a b = a : fibs b (a + b)

-- Fast doubling
fDoubling :: Integer -> Integer
fDoubling n | n >= 0 = fst (fFib n)

fFib :: Integer -> (Integer, Integer)
fFib 0 = (0, 1)
fFib n =
  let
    (a, b) = fFib (div n 2)
    c = a * (b * 2 - a)
    d = a * a + b * b
  in if mod n 2 == 0 then (c, d) else (d, c + d)
