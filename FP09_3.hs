module FP09_3 where

data Node a = Nothing | Cons a (Node a)
data Node a = Node
    { label    :: a
    , adjacent :: [Node a]
    }

data Graph a = Graph [Node a]
{-
Queue
constructors:
head
tail

functions:
isEmpty
add
remove
-}
data Queue

{-
Stack
constructors:

functions:
isEmpty
push
pop
-}
type Stack a = [a]

stack1 = [1,2,3,4]
stack2 = f_stack_push stack1 0
stack3 = f_tuple_scnd $ f_stack_pop stack2

f_tuple_scnd::(a,b)->b
f_tuple_scnd (_,b) = b

f_stack_pop::(Stack a)->(a, Stack a)
f_stack_pop (x:xs) = (x, xs)

f_stack_push::(Stack a)->a->(Stack a)
f_stack_push stack value = value:stack
