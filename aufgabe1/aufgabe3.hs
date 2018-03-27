-- This program calculates the number of bonbons you can buy with the money you enter as a parameter in `user 155`

-- user function sets counter and bonbon price to prevent cheating
funcUser money = funcBonbon 0 money 10

-- iterates counter as long as money is more than bonbonPrice
funcBonbon counter money bonbonPrice | money < bonbonPrice = counter
  | otherwise = funcBonbon (counter+1) (money-bonbonPrice) (z+10)