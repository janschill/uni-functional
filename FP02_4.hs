module FP02_4 where

f_lower_list::Int->Int->[a]->[a]
f_lower_list low up list = drop low (take up list)