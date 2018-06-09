module FP12 where

data Exp = Num Float
         | Add Exp Exp
         | Sub Exp Exp
         | Mult Exp Exp
         | Div Exp Exp
         deriving (Eq, Show, Read)

exp1 = Add (Num 1.5) (Mult (Num 3) (Num 2))

calc::Exp->Float
calc (Num n) = n
calc (Add e1 e2) = (calc e1) + (calc e2)
calc (Sub e1 e2) = (calc e1) - (calc e2)
calc (Mult e1 e2) = (calc e1) * (calc e2)
calc (Div e1 (Num 0)) = error "No division by 0"
calc (Div e1 e2) = (calc e1) / (calc e2)