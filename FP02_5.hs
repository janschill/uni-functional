module FP02_5 where

f_fib_number::Integer->Integer
f_fib_number 0 = 0
f_fib_number 1 = 1
f_fib_number a = f_fib_number(a-1) + f_fib_number(a-2)

f_fib_list::Integer->[Integer]
f_fib_list 0 = [0]
f_fib_list a = [f_fib_number a] ++ f_fib_list (a-1)