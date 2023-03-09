-- lab 3 (wk5)
{-
1. In Haskell, String is a synonym for [Char]. Test whether the following two lists are the same:
[’a’,’b’,’b’] :: String
"abb" :: String

True
-}

{-
2. 
(a) Define a function allEven :: [Int] -> Bool that tests whether the elements of the input list are all even numbers.
(b) Using a list comprehension to define a function addp :: [(Int,Int)] -> [Int] 
that adds each pairs of integers together. For instance:
> addp [(1,2), (4,3), (2,7)]
[3,7,9]
(c) Define addpp :: [(Int,Int)] -> [Int] which is the same as addp above except that the sum of (m,n) only appears in the result list if m<n. For instance, 
> addpp [(1,2), (4,3), (2,7)]
[3,9]
-}
-- a
allEven :: [Int] -> Bool
--allEven [] = True
--allEven (x:xs) = even x && allEven xs
-- or
allEven = foldr (\x b -> even x && b) True
{- The lambda abstraction \x b -> even x && b is of type Int -> Bool -> Bool; i.e., 
its first and second argument have different types, but its result type coincides with the type of the second argument. T-}

--b
addpp :: [(Int,Int)] -> [Int]
addpp pairs = [m + n | (m, n) <- pairs]

--c
addppmlessn :: [(Int,Int)] -> [Int]
addppmlessn pairs = [m + n | (m, n) <- pairs, m < n]

{-
3. A triple (x, y, z) of positive integers is called pythagorean if x2 + y2 = z2. Using a list comprehension, define a function
pyths :: Int -> [(Int,Int,Int)]
that maps an integer n to all pythagorean triples (a1, a2, a3) with com-
ponents ai in [1..n]. For example:
> pyths 5
[(3,4,5),(4,3,5)]
> pyths 10
[(3,4,5)], (4,3,5), (6,8,10), (8,6,10)]
-}
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

{-
4. A positive integer is perfect if it equals the sum of all of its factors, ex-
cluding the number itself. Using a list comprehension, define a function
perfects :: Int -> [Int] that, given the input integer n, returns
the list of all perfect numbers up to n. For example:
> perfects 500
[6,28,496]
(Hint: Use the library function init and the function factors as
defined in the lecture slides VI.)
-}
perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], let fs = factors x, not (null fs), sum fs == x]
    where factors x = [y | y <- [1..x-1], x `mod` y == 0]
{-The not (null fs) check ensures that the list of factors fs is not empty before the init function is called on it.-}