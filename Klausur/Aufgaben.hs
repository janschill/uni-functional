module Aufgaben where


{- Aufgabe 3 -}
data Person = Student Name [Noten] deriving Show

type Name = String
type Fach = String
type Note = Double
type Noten = (Fach, Note)

s1 = Student "Test" [("Test", 2.3),("Test", 3.0),("Test", 4.0),("Test", 3.3),("Test", 3.3),("Test", 1.7),("Test", 1.3),("Test", 1.7),("Test", 1.0),("Test", 2.3),("Test", 1.3),("Test", 1.7),("Test", 1.3),("Test", 1.3),("Test", 1.0),("Test", 1.7),("Test", 1.0),("Test", 3.0),("Test", 1.0),("Test", 2.7),("Test", 2.3),("Test", 1.7),("Test", 1.7),("Test", 2.3),("Test", 1.0)]

median::Person->Double
median (Student _ []) = 0
median (Student _ noten) = aux noten 0 (length noten)
  where
    aux::[Noten]->Double->Int->Double
    aux [] summe laenge = summe / (fromIntegral laenge)
    aux ((_,x):xs) summe laenge = aux xs (summe+x) laenge

{- Aufgabe 4 -}
zip'::[(a,a)]->([a],[a])
zip' list = (aux list, aux' list)
  where
    aux::[(a,a)]->[a]
    aux [] = []
    aux ((x,_):xs) = [x] ++ aux xs

    aux'::[(a,a)]->[a]
    aux' [] = []
    aux' ((_,x):xs) = [x] ++ aux' xs

zip''::[(a,a)]->([a],[a])
zip'' list = ([fst x | x <- list],[snd y | y <- list])

{- Aufgabe 5 -}
data BinaerListe a = Empty | Node (BinaerListe a) [a] (BinaerListe a)

b1 = Node (Node Empty [1..5] Empty) [1,2,3] (Node Empty [1..5] Empty)
b2 = Node (Node Empty [1..4] Empty) [1,2,3] (Node Empty [1..5] Empty)
b3 = Node Empty [1,2,3] (Node Empty [1..5] Empty)

instance Eq a => Eq (BinaerListe a) where
  (==) Empty Empty = True
  (==) (Node left1 values1 right1) (Node left2 values2 right2) = (left1 == left2) && (right1 == right2) && (aux values1 values2)
       where
        aux::Eq a=>[a]->[a]->Bool
        aux [] [] = True
        aux (x:xs) (y:ys) = (x==y) && (aux xs ys)
        aux _ _ = False
  (==) _ _ = False

