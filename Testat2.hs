list = [[1..3],[4,3..1]]
list2 = f_concatenate list
list3 = f_concatenate' list

{-
concat function using pattern matching
-}
f_concatenate::[[Int]]->[Int]
f_concatenate [] = []
f_concatenate (x:xs) = x ++ f_concatenate xs

{-
concat function using list comprehension
-}
f_concatenate'::[[Int]]->[Int]
f_concatenate' [] = []
f_concatenate' xxs = [x | l <- xxs, x <- l]

{-
function to count the number of value in a tree
-}

data Tree = Leaf Int | Node Int [Tree] deriving Show
data List = Empty | Num Int List deriving Show

tree1 = Node 6 [(Node 3 [Leaf 2]), Node 4 [Leaf 3, Leaf 6]]

f_count_tree::Tree->Int
f_count_tree (Leaf _) = 1
f_count_tree (Node _ trees) = 1 + f_count_tree' trees
  where
    f_count_tree'::[Tree]->Int
    f_count_tree' [] = 0
    f_count_tree' (t:ts) = f_count_tree t + f_count_tree' ts

{-
converts a tree into a recursive defined data list
-}
f_convert_tree::Tree->List
f_convert_tree (Leaf v) = Num v Empty
f_convert_tree (Node v trees) = Num v (f_convert_tree' trees)
    where
      f_convert_tree'::[Tree]->List
      f_convert_tree' [] = Empty
      f_convert_tree' (Node v ts:tss) = Num v (f_convert_tree' (ts ++ tss))
      f_convert_tree' (Leaf v:tss) = Num v (f_convert_tree' tss)