f_rek::Integer->Integer
f_rek 0 = 0
f_rek a = a * a + f_rek (a-1)

fib_rek::Integer->Integer
fib_rek 0 = 0
fib_rek 1 = 1
fib_rek a | a > 1 = fib_rek(a-1) + fib_rek(a-2)
  | otherwise = 0