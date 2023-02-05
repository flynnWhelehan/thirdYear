{-
1. Write down a definition for each of bools/nums/add/copy/apply so that
they have the following types:
bools :: [Bool]
nums :: [[Int]]
add :: Int -> Int -> Int -> Int
copy :: a -> (a,a)
apply :: (a->b)->a->b
-}
bools = [False,False]
nums = [[1], [2,3], []]
add x y z = x+y+z
copy x = (x,x)
apply f x = f x


{-
2. Define a function third :: [a] -> a that returns the third element of the
input list that contains at least three elements, by means of the
following:
(a) head and tail;
(b) pattern matching.
-}
-- a
third xs = head (tail (tail xs))
-- b
third (_:_:x:_) = x


{-
3. In a similar way to &&, as shown in the slides on Programming with
Functions, show how the disjunction operator || can be defined in three
different ways by means of pattern matching. 

_ || _ = True
False || b = b
True || _ = True
-}

