module FP09_1 where

import FP08

d_tree3 = f_list2tree d_list
sum_tree3 = f_sum_tree d_tree3

{-
sum of all values of a binary tree
-}
f_sum_tree::(Num a)=>(BinaryTree a)->a
f_sum_tree Empty = 0
f_sum_tree (Node bt1 v bt2) = v + (f_sum_tree bt1) + (f_sum_tree bt2)