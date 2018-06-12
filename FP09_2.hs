module FP09_2 where

import FP09_1
import FP08

btree11 = Node (Node Empty 2 Empty) 1 (Node Empty 3 Empty)
btree12 = Node (Node Empty 5 Empty) 4 (Node Empty 6 Empty)
tree11 = Node' 1 [Node' 2 [], Node' 3 [], Node' 5 []]
tree12 = Node' 2 [Node' 3 [], Node' 4 [], Node' 6 []]

{-
implementation of (==) and (/=) for binary tree
-}
instance (Eq a) => Eq (BinaryTree a) where
  (==) Empty Empty = True
  (==) (Node left1 v1 right1) (Node left2 v2 right2) = (left1 == left2) && (v1 == v2) && (right1 == right2)

  (/=) btree1 btree2 = not (btree1 == btree2)

{-
implementation of (==) and (/=) for tree
-}
instance (Eq a) => Eq (Tree a) where
  (==) Empty' Empty' = True
  (==) (Node' v1 trees1) (Node' v2 trees2) = (v1 == v2) && (aux trees1 trees2)
    where
      aux [] [] = True
      aux (t1:ts1) (t2:ts2) = (t1 == t2) && (aux ts1 ts2)

  (/=) tree1 tree2 = not (tree1 == tree2)
{-
implementation of (+) for binary tree
-}
instance (Num a) => Num (BinaryTree a) where
  (+) Empty Empty = Empty
  (+) btree Empty = btree
  (+) Empty btree = btree
  (+) (Node l1 v1 r1) (Node l2 v2 r2) = Node (l1 + l2) (v1 + v2) (r1 + r2)

  (*) Empty Empty = Empty
  (*) (Node l1 v1 r1) (Node l2 v2 r2) = Node (l1 * l2) (v1 * v2) (r1 * r2)

{-
implementation of (+) for tree
-}
instance (Num a) => Num (Tree a) where
  (+) Empty' Empty' = Empty'
  (+) tree Empty' = tree
  (+) Empty' tree = tree
  (+) (Node' v1 tts1) (Node' v2 tts2) = Node' (v1+v2) (sum tts1 tts2)
    where
      sum [] [] = []
      sum trees [] = trees
      sum [] trees = trees
      sum (t1:ts1) (t2:ts2) = (t1 + t2) : (sum ts1 ts2)

  (*) Empty' Empty' = Empty'
  (*) (Node' v1 trees1) (Node' v2 trees2) = Node' (v1*v2) (aux trees1 trees2)
    where
      aux [] [] = []
      aux (t1:ts1) (t2:ts2) = (t1*t2):(aux ts1 ts2)
{-
implementation of show function for binary tree
-}
instance (Show a) => Show (BinaryTree a) where
  show Empty = "Empty"
  show (Node left value right) = show value ++ " " ++ show left ++ " " ++ show right

{-
implementation of show function for tree
-}
instance (Show a) => Show (Tree a) where
  show Empty' = ""
  show (Node' value trees) = show value ++ " " ++ show' trees
    where
      show' [] = ""
      show' (t:ts) = show t ++ show' ts