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
--elem' val xs = foldr (\ x -> (||) (val == x)) True xs