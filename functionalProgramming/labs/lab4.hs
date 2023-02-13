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