-- This program calculates the number of bonbons you can buy with the money you enter as a parameter in `user 155`

-- user function sets counter and bonbon price to prevent cheating
f_user::(Num a, Ord a)=>a->a
f_user money = f_bonbon 0 money 10

-- iterates counter as long as money is more than bonbonPrice
f_bonbon::(Num a, Ord a)=>a->a->a->a
f_bonbon counter money bonbonPrice | (money < bonbonPrice) || (bonbonPrice > 100) = counter
  | otherwise = f_bonbon (counter+1) (money-bonbonPrice) (bonbonPrice+10)