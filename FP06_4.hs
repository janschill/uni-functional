module FP06_4 where

import FP06_3

d_str = "Dies ist ein ein Beispielsatz . . ."

f_wordList::String->[(String, Int)]
f_wordList str =
  let
    d_wordList = words str
    d_filteredList = filterRepetition d_wordList
    f_count word = length . filter (word==)

    f_word [] = []
    f_word (x:xs) = [(x, f_count x d_wordList)] ++ f_word xs

    f_word' (x:xs) = foldr (\x xs -> [(x, f_count x d_wordList)] ++ xs) [] (d_filteredList)
  in
    f_word' d_filteredList
