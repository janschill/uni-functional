module FP09 where

{- binary tree
– each node can have a maximum of two child nodes
– can be Nil
-}

tree1::Tree
tree1 = Forest 11 [Forest 21 [Leaf' 31], Forest 22 [Forest 31 [Leaf' 41]], Forest 23 [Forest 32 [Leaf' 42]]]

btree1::BinaryTree
btree1 = Node (Node (Leaf 31) 21 (Leaf 32)) 11 (Node (Leaf 34) 22 (Node (Leaf 41) 35 (Leaf 42)))

data Tree =
    Leaf' Int
  | Forest Int [Tree]
  deriving Show

data BinaryTree =
    Leaf Int
  | Node BinaryTree Int BinaryTree
  deriving Show

f_contains::Int->BinaryTree->Bool
f_contains i (Leaf v) = i == v
f_contains i (Node t1 v t2) | i == v = True
                            | otherwise = f_contains i t1 || f_contains i t2

f_contains'::Int->Tree->Bool
f_contains' i (Leaf' v) = i == v
f_contains' i (Forest v xxs) | i == v = True
                             | otherwise = f_check i xxs
                               where
                                 f_check::Int->[Tree]->Bool
                                 f_check _ [] = False
                                 f_check i (x:xs) = if f_contains' i x then True else f_check i xs