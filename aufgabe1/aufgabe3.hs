-- This program calculates the number of bonbons you can buy with the money you enter as a parameter in `user 155`

-- user function sets counter and bonbon price to prevent cheating
funcUser::(Num a, Ord a)=>a->a
funcUser money = funcBonbon 0 money 10

-- iterates counter as long as money is more than bonbonPrice
funcBonbon::(Num a, Ord a)=>a->a->a->a
funcBonbon counter money bonbonPrice | (money < bonbonPrice) || (bonbonPrice > 100) = counter
  | otherwise = funcBonbon (counter+1) (money-bonbonPrice) (bonbonPrice+10)