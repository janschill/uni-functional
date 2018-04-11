f_fib_number::Integer->Integer
f_fib_number 0 = 0
f_fib_number 1 = 1
f_fib_number a = f_fib_number(a-1) + f_fib_number(a-2)

f_fib_list::Integer->[Integer]
f_fib_list 0 = [0]
f_fib_list a = [f_fib_number a] ++ f_fib_list (a-1)

-- Internet Fibonacci calculations

-- List version
f_fib n = f_fibs 0 1 !! n
  where
    f_fibs a b = a : f_fibs b (a + b)

-- Fast doubling
f_doubling :: Integer -> Integer
f_doubling n | n >= 0 = fst (f_fib n)
    where
      f_fib :: Integer -> (Integer, Integer)
      f_fib 0 = (0, 1)
      f_fib n =
        let
          (a, b) = f_fib (div n 2)
          c = a * (b * 2 - a)
          d = a * a + b * b
        in if mod n 2 == 0 then (c, d) else (d, c + d)
