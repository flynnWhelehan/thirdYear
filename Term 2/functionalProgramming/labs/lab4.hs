-- 1.
-- concatenate a list of list using recursion
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs

-- produce a list with n identical elements using recursion
replicate' :: Int -> a -> [a]
replicate' 0 item = []
replicate' n item = [item] ++ replicate' (n-1) item

-- decide if a value is an element of a list with recursion
elem' :: Eq a => a -> [a] -> Bool
elem' val [] = False
elem' val (x:xs) = (val == x) || elem' val xs
-- also can be done like this remember 
    -- elem' val xs = foldr (\ x -> (||) (val == x)) True xs

-- 2. Recursive function that merges two sorted lists of integers to give a single sorted list.
merge' :: [Int] -> [Int] -> [Int]
merge' [] ys = ys
merge' xs [] = xs
merge' (x:xs) (y:ys) = if x <= y 
    then [x] ++ merge' xs (y:ys) 
    else [y] ++ merge' (x:xs) ys 

-- 3. Recursive function for merge sort, with rules: 
    -- lists of length <= to 1 are already sorted
    -- other lists can be sorted by sorting the two halves and merging the resulting lists
--also make use of halve:
halve' :: [a] -> ([a], [a])
halve' xs = splitAt (length xs `div` 2) xs

msort' :: [Int] -> [Int]
msort' xs
    | length xs <= 1 = xs
    | otherwise = merge' (msort' left) (msort' right)
    where (left, right) = halve' xs

-- 4. Function that uses map and filter rather than list-comprehension (see existing implementations):
-- list comprehension version:
some_function :: (a -> b) -> (a -> Bool) -> [a] -> [b]
some_function f p xs = [f x | x <- xs, p x]
-- map and filter version:
map_and_filter :: (a -> b) -> (a -> Bool) -> [a] -> [b]
map_and_filter f p xs = map f (filter p xs)

{-
The map function applies the function f to each element of the list xs, and returns a new list with the results. 
The filter function returns a new list containing only the elements of xs that satisfy the predicate p. 
The map_and_filter function first applies filter to xs to get a filtered list,
    and then applies map to the filtered list to get the final list of mapped elements. 
The resulting list is equivalent to the list comprehension [f x | x <- xs, p x].

e.g. 
map_and_filter (*2) (\x -> x > 4) [1, 2, 3, 4, 5, 6]
each element is *2, but only on the filtered elements above 4
-}

-- 5. Redefine map f and filter p using foldr
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = foldr (\x acc -> if p x then x : acc else acc) [] xs
{-
The map' function applies f elements of the input list xs. 
    It returns a new list with the results. 
    foldr recursively builds output list by prepending the result of applying f to each element to the accumulator.

The filter' function returns a new list containing only the elements of the input list xs that satisfy the predicate p. 
    foldr recursively builds output list by appending elements that satisfy p to the accumulator, and skipping elements that do not.
-}

map_and_filter' :: (a -> b) -> (a -> Bool) -> [a] -> [b]
map_and_filter' f p xs = map' f (filter' p xs)
