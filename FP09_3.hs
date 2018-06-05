module FP09_3 where

{-
Queue implemented with a list
-}
type Queue a = [a]

queue1 = [1,2,3,4]
queue2 = enqueue queue1 5
queue3 = dequeue queue2

enqueue::(Queue a)->a->(Queue a)
enqueue queue v = queue ++ [v]

dequeue::(Queue a)->(Queue a)
dequeue (q:qs) = qs

queuePeek::(Queue a)->a
queuePeek (x:_) = x

queueEmpty::(Queue a)->Bool
queueEmpty (x:_) = False
queueEmpty _ = True

queueSize::(Queue a)->Int
queueSize [] = 0
queueSize (_:xs) = 1 + queueSize xs

{-
Stack implemented with a list
-}
type Stack a = [a]

stack1 = [1,2,3,4]
stack2 = push stack1 0
stack3 = pop stack2

push::(Stack a)->a->(Stack a)
push stack v = v:stack

pop::(Stack a)->(Stack a)
pop (x:xs) = xs

stackPeek::(Stack a)->a
stackPeek (x:_) = x

stackEmpty::(Stack a)->Bool
stackEmpty (x:_) = False
stackEmpty _ = True

stackSize::(Stack a)->Int
stackSize [] = 0
stackSize (_:xs) = 1 + stackSize xs