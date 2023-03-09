{-
1. Show that, for any number x, sum [x] = x.
sum [x]
    = x + sum [] (applying sum)
    = x + 0 (applying sum)
    = x (applying +)
-}

{-
2. Define a function product that produces the product of a list of
numbers, and show using your definition that product [2,3,4] = 24.
-}
product [] = 1
product (n:ns) = n * product ns
{-
Product [2,3,4]
    = 2 * (product [3,4]) (applying product)
    = 2 * (3 * (product [4])) (applying product)
    = 2 * (3 * (4 * (product []))) (applying product)
    = 2 * (3 * (4 * 1)) (applying product)
    = 24 (applying * repeatedly)
-}

{-
3. How should the definition of qsort be modified so that it returns a list in
its descending order?
-}
qsort [] = []
qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
where
    smaller = [a | a <- xs, a <= x]
    larger = [b | b <- xs, b > x]
