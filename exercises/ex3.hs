{-
Exercises
1. Using list comprehension, give an expression that calculates the sum of
the first one hundred integer squares:
1^2 + 2^2 + 3^2 + … + 100^2
-}
sumHundredIntSquares = [x^2 | x <- [1..100]]

{-
2. The library function
'replicate :: Int → a → [a]'
produces a list whose length is given by the first argument and whose
elements are identical to the second argument. For example,
replicate 3 True = [True,True,True]

Use list comprehension to define replicate.
-}