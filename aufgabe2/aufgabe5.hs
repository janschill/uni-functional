funcFibonacciNumber::Int->Int
funcFibonacciNumber 0 = 0
funcFibonacciNumber 1 = 1
funcFibonacciNumber a = funcFibonacciNumber(a-1) + funcFibonacciNumber(a-2)

funcFibonacciList::Int->[Int]
funcFibonacciList 0 = [0]
funcFibonacciList a = [funcFibonacciNumber a] ++ funcFibonacciList (a-1)