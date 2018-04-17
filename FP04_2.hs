f_power::Integer->Integer->Integer
f_power 0 _ = 1
f_power power base = f_iter base power 1
  where
    f_iter::Integer->Integer->Integer->Integer
    f_iter n 0 akk = akk
    f_iter n m akk = f_iter n (m-1) (akk*n)

f_square::Integer->Integer
f_square = f_power 2

f_cube::Integer->Integer
f_cube = f_power 3
