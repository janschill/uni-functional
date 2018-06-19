# Klausur Funktionale Programmierung

## 1. Datentypen der folgenden Ausdrücke

```haskell
(1,1.0,[]):[]::(Num a1, Fractional b)=>[(a1,b,[a2])]

f::t1->(t1->t2->t3)->t2->t3
f x y z = y x z
```

## 2. Ausdrücke auswerten

```haskell
> map (\x->x+x) (reverse [1..4])
= [8,6,4,2]
```

## 3. Funktion für die Berechnung des Mittelwerts eines Datentyps

```haskell
data Person = Student Name [Noten]

type Name = String
type Fach = String
type Note = Double
type Noten = [(Fach, Note)]

median::Person->Double
median (Student _ []) = 0
median (Student _ noten) = aux noten 0 (length noten)
  where
    aux::[Noten]->Double->Int->Double
    aux [] summe laenge = summe / (fromIntegral laenge)
    aux ((_,x):xs) summe laenge = aux xs (summe+x) laenge
```

## 4. zip Funktion nachbauen

### Pattern matching

```haskell
zip'::[(a,a)]->([a],[a])
zip' list = (aux list, aux' list)
  where
    aux::[(a,a)]->[a]
    aux [] = []
    aux ((x,_):xs) = [x] ++ aux xs

    aux'::[(a,a)]->[a]
    aux' [] = []
    aux' ((_,x):xs) = [x] ++ aux' xs
```

### Listenbeschreibung

```haskell
zip''::[(a,a)]->([a],[a])
zip'' list = ([fst x | x <- list],[snd y | y <- list])
```

## 5. Binärliste mit Eq (==) Funktion

```haskell
data BinaerListe a = Empty | Node (BinaerListe a) [a] (BinaerListe a)

b1 = Node (Node Empty [1..5] Empty) [1,2,3] (Node Empty [1..5] Empty)
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
```

## 6. ?

## 7. Substitutionsverfahren und Run-time

```haskell
wiederholen 0 m = 0
wiederholen n m = m : wiederholen (n-1) 0

add list = head list + head (rest list)

head (x:_) = x
rest (_:xs) = xs
```