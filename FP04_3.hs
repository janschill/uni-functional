foldr::(a->b->b)->b->[a]->b
foldr _ element [] = element
foldr fun element (x:xs) = fun x (foldr fun element xs)