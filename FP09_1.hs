module FP09_1 where

import FP08

d_tree3 = convertListToBinaryTree d_list
sum_tree3 = f_sum_binary_tree d_tree3

{-
sum of all values of a binary tree
-}
f_sum_binary_tree::(Num a)=>(BinaryTree a)->a
f_sum_binary_tree Empty = 0
f_sum_binary_tree (Node bt1 v bt2) = v + (f_sum_binary_tree bt1) + (f_sum_binary_tree bt2)

{-
sum of all values of a tree
-}
f_sum_tree::(Num a)=>(Tree a)->a
f_sum_tree Empty' = 0
f_sum_tree (Node' v tts) = v + f_sum_tree' tts
  where
    f_sum_tree'::(Num a)=>[Tree a]->a
    f_sum_tree' [] = 0
    f_sum_tree' (t:ts) = f_sum_tree t + f_sum_tree' ts
