module FP08 where

import FP05_3
import Helper

{- binary tree
– each node can have a maximum of two child nodes
– can be Nil
-}

tree1::(Num a)=>(Tree a)
tree1 = Node' 11 [Node' 21 [Empty'], Node' 22 [Node' 31 [Empty']], Node' 23 [Node' 32 [Empty']]]

btree1::(Num a)=>(BinaryTree a)
btree1 = Node (Node (Node Empty 31 Empty) 21 (Node Empty 32 Empty)) 11 (Node (Node Empty 34 Empty) 22 (Node (Node Empty 41 Empty) 35 (Node Empty 42 Empty)))

data BinaryTree a =
  Empty
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Show)

data Tree a =
    Empty'
  | Node' a [Tree a]
  deriving (Eq, Show)

{-
checks if a binary tree contains an element
-}
f_contains::(Eq a, Num a)=>a->(BinaryTree a)->Bool
f_contains _ Empty = False
f_contains i (Node t1 v t2) | i == v = True
                            | otherwise = f_contains i t1 || f_contains i t2

{-
checks if a tree contains an element
-}
f_contains'::(Eq a)=>a->Tree a->Bool
f_contains' i Empty' = False
f_contains' i (Node' v xxs) | i == v = True
                            | otherwise = f_check i xxs
                              where
                                f_check::(Eq a)=>a->[Tree a]->Bool
                                f_check _ [] = False
                                f_check i (x:xs) = if f_contains' i x then True else f_check i xs

{-
converts a binary tree into a list
-}
f_convert::(BinaryTree a)->[a]
f_convert Empty = []
f_convert (Node t1 v t2) = v : (f_convert t1) ++ (f_convert t2)

{-
converts a tree into a list
-}
f_convert'::(Tree a)->[a]
f_convert' Empty' = []
f_convert' (Node' v xxs) = v : f_help xxs
                          where
                            f_help::[Tree a]->[a]
                            f_help [] = []
                            f_help (x:xs) = f_convert' x ++ f_help xs

{-
sorts a list into a binary tree
[8,2,1,5]

     8
    / \
   2
  / \
1   5
-}

d_list = [8,2,1,5,3,10,6,7,11,4,9]
d_tree = Node (Node (Node Empty 1 Empty) 2 (Node Empty 5 Empty)) 8 Empty

singleton::(Ord a)=>a->(BinaryTree a)
singleton value = Node Empty value Empty

f_insert::(Ord a)=>a->(BinaryTree a)->(BinaryTree a)
f_insert value Empty  = singleton value
f_insert value (Node t1 v t2) | value == v = Node t1 v t2
                              | value < v = Node (f_insert value t1) v t2
                              | otherwise = Node t1 v (f_insert value t2)

f_list2tree::(Ord a)=>[a]->(BinaryTree a)
f_list2tree xxs = f_list xxs Empty
  where
    f_list::(Ord a)=>[a]->(BinaryTree a)->(BinaryTree a)
    f_list [] tree = tree
    f_list (x:xs) tree = f_list xs (f_insert x tree)

d_tree2 = f_list2tree random1000
d_list2 = f_convert_sort d_tree2

{-
converts a binary tree into an ordered list
-}
f_convert_sort::(Ord a)=>(BinaryTree a)->[a]
f_convert_sort Empty = []
f_convert_sort (Node bt1 v bt2) = f_convert_sort bt1 ++ [v] ++ f_convert_sort bt2