f_power::Integer->Integer->Integer
f_power _ 0 = 1
f_power n m = f_iter n m 1
  where
    f_iter::Integer->Integer->Integer->Integer
    f_iter n 0 akk = 1 * akk
    f_iter n m akk = f_iter n (m-1) (akk*n)
