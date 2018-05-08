module Vorlesung5 where

primeNumber::Int->[Int]
primeNumber n = [x | x <- [2..n], isPrime x]

isPrime::Int->Bool
isPrime n = factors n == [1,n]

factors::Int->[Int]
factors n = [x | x <- [1..n], mod n x == 0]