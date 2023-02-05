{-
Exercises
1. Using list comprehension, give an expression that calculates the sum of
the first one hundred integer squares:
1^2 + 2^2 + 3^2 + … + 100^2
-}
sumHundredIntSquares = [x^2 | x <- [1..100]]
-- can adapt list to increment through odd numbers
sumHundredOddIntSquares = [x^2 | x <- [1,3..100]]
-- or:
sumHundredOddIntSquares' = [x^2 | x <- [1..100], x `mod` 2 /= 0]
-- can specify multiple
sumHundredMultipleSquares = [x^2 | x <- [1..100], x `mod` 5 == 0]
-- can use pairs to make calculations clear
aaa' = [(x,y^2) | y <- [1..100], x <- [y], x `mod` 5 == 0]

{-
2. The library function
'replicate :: Int → a → [a]'
produces a list whose length is given by the first argument and whose
elements are identical to the second argument. For example,
replicate 3 True = [True,True,True]

Use list comprehension to define replicate.
-}