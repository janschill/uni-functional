module FP04_4 where

import FP03_2

fFak::Integer->Integer
fFak n = iter n 1
  where
    iter::Integer->Integer->Integer
    iter 0 akk = akk
    iter n akk = iter (n-1) (n*akk)

fBinom::Integer->Integer->Integer
fBinom n k = div (fFak n) ((fFak k) * (fFak (n-k)))