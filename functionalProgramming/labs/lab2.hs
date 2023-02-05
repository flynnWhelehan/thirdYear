-- lab 4
{-
1. What are the types of the following
(a) values:
[’a’,’b,’c’] :: [char]
(’a’,’b’,’c’) :: (char,char,char)
[(False,’0’),(True,’1’)] :: [(Boolean, Char)]
([False,True],[’0’,’1’]) :: ([Boolean],[Char])
[tail,init,reverse] :: [[a] -> [a]]
-}

-- (b) functions:
second xs = head (tail xs) 
-- :: [a] -> [a] -> [a]
swap (x,y) = (y,x)
-- :: (a,b) -> (b,a)
pair x y = (x,y)
-- :: x -> y -> (x,y)
double x = x*2
-- :: Num a => a -> a
palindrome xs = reverse xs == xs
-- :: 'a -> a -> bool' XXX wrong
-- :: Eq a => a -> [a] -> bool
-- here, Eq means a must be of a type that can be checked for equality
twice f x = f (f x)
-- :: a -> b -> (a b)

--Q3
doubleAll :: [Integer] -> [Integer]
doubleAll [] = []
doubleAll (x:xs) = [x * 2] ++ doubleAll xs 

isEven :: Integer -> Bool
isEven x = ((x `mod` 2) == 0)

halve :: [a] -> ([a], [a])
halve xs = let len = length xs
    -- if length equal 
    in if len `mod` 2 == 0
        -- tuple of (take length/2 elements of xs, all but length/2 elements of xs)
        then (take(len `div` 2) xs, drop (len `div` 2) xs)
        else ([],[])

-- Q4
safetail xs = if null xs then [] else tail xs

safetail_guarded xs | null xs = []
                    | otherwise = tail xs

safetail_pattern_match [] = []
safetail_pattern_match (_:xs) = xs

twiceee x = (x,1.0)
