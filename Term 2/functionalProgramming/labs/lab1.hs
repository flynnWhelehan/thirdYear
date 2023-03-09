-- Lab 1 (wk3)
--1. N/A (Setting up)

-- 2.
n = a `div` length xs 
    where 
        a = 10
        xs = [1,2,3,4,5]

-- 3.
qsortreverse [] = []
qsortreverse (x:xs) =
    qsortreverse smaller ++ [x] ++ qsortreverse larger
    where
        smaller = [a | a <- xs, a >= x]
        larger = [b | b <- xs, b < x]

qsort [] = []
qsort (x:xs) =
    qsort smaller ++ [x] ++ qsort larger
    where
        smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]

qsortnodupes [] = []
qsortnodupes (x:xs) =
    qsortnodupes smaller ++ [x] ++ qsortnodupes larger
    where
        smaller = [a | a <- xs, a < x]
        larger = [b | b <- xs, b > x]

{-
(a) What would be the effect of replacing <= by < in the above definition?
Does not consider duplicates (two terms that are equal)
The list [1,2,3,4,2,1,5] is sorted to [1,2,3,4,5]

(b) How should qsort be modified so that it produces a reverse sorted version of a list?
Invert <= to >= and < to >
-}

{- 
4. Show how the library function last that selects the last element of a
list can be defined using some of the functions among head, tail, !!,
length and reverse. Use GHCi to verify your answer.
-}
--
lastcustom xs = xs !! (length xs - 1)
