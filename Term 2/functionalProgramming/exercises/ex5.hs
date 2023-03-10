-- 1. Without looking at the Prelude, define the following functions
{-
a. all :: (a→Bool) → [Bool] → Bool, which decides if all elements of a
list satisfy a predicate.
-}
all p = and . map p
{-
b. takeWhile :: (a→Bool) → [a] → [a], which selects elements from a
list while they satisfy a predicate.
-}
takeWhile' _ [] = []
takeWhile' p (x:xs) 
    | p x = x : takeWhile' p xs
    | otherwise = x:xs
{-
2. Without looking at the Prelude, define the function curry that converts a
function on pairs into a curried function.
-}
curry :: ((a,b) -> c) -> (a -> b -> c)
curry f = \x y -> f (x,y)