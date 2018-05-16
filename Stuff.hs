module Stuff where


data Tree =
    Leaf Int
  | Node Int Tree Tree
  deriving Show

f_tree_to_list::Tree->[Int]
f_tree_to_list (Leaf v) = [v]
f_tree_to_list (Node v t1 t2) = v : f_tree_to_list t1 ++ f_tree_to_list t2

tree1::Tree
tree1 = Node 5 (Node 3 (Leaf 2) (Leaf 1)) (Leaf 4)

add 0 m = m
add n m = inc (add (dec n) m)

add' 0 m = m
add' n m = add' (dec n) (inc m)

inc n = n + 1
dec n = n - 1