module FP02_3 where

f_is_Empty::[a]->Bool
f_is_Empty [] = True
f_is_Empty _ = False

f_top::[a]->a
f_top (firstElement:_) = firstElement

f_push::[a]->a->[a]
f_push list element = element:list

f_pop::[a]->[a]
f_pop [] = []
f_pop (_:restList) = restList