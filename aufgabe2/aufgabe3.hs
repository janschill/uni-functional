funcIsEmpty::[a]->Bool
funcIsEmpty [] = True
funcIsEmpty _ = False

funcTop::[a]->a
funcTop (firstElement:_) = firstElement

funcPush::[a]->a->[a]
funcPush list element = element:list

funcPop::[a]->[a]
funcPop [] = []
funcPop (_:restList) = restList