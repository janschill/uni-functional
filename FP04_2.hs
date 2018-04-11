fPotenz::Integer->Integer->Integer
fPotenz _ 0 = 1
fPotenz n m = iter n m 1
  where
    iter::Integer->Integer->Integer->Integer
    iter n 0 akk = 1 * akk
    iter n m akk = iter n (m-1) (akk*n)
