module FP02_3 where

type (Stack a) = [a]

isEmpty::(Stack a)->Bool
isEmpty [] = True
isEmpty _ = False

push::a->(Stack a)->(Stack a)
push element stack = element:stack

top::(Stack a)->a
top [] = error "no element in stack"
top (s:_) = s

pop::(Stack a)->(Stack a)
pop [] = []
pop (_:ss) = ss