{-
FP Lab 5
1. 
(a) Define a function add :: Nat -> Nat -> Nat that computes the
sum of two natural numbers using pattern-matching and recur-
sion.
-}
{-
Define custom data type Nat to represents natural numbers. 
Nat has two constructors: 
    Zero which represents 0
    Succ, taking a Nat argument, represents the successor of that natural number
The add function takes two (Nat) args x and y, and returns their sum as another Nat. 
-}
data Nat = Zero | Succ Nat
add :: Nat -> Nat -> Nat
-- If the x is Zero, return y (base case)
add Zero y = y
{-
If the first argument is a successor Succ x, recursively add x and y:
    Construct a new Nat using the Succ constructor to represent the successor of the sum of x and y (recursive case)
-}
add (Succ x) y = Succ (add x y)

{-
(b) Define a function mult :: Nat -> Nat -> Nat that computes
the product of two natural numbers using pattern-matching, re-
cursion and the function add defined above.
-}
mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ x) y = add y (mult x y)

{-
2. 
Consider the following type of binary trees of integers:
data Tree = Leaf Int | Node Tree Tree
deriving (Show)
Such a tree is balanced if the number of leaves in the left and right
subtrees of every node differs by at most one, with leaves themselves
being trivially balanced.
Define a function balanced :: Tree -> Bool that decides whether a
tree is balanced. 
(Hint: first define a function that returns the number of leaves of a tree.)
-}
data Tree = Leaf Int | Node Tree Tree
    -- generate a Show instance for Tree (so we can print it)
    deriving (Show)
balanced :: Tree -> Bool
balanced (Leaf _) = True
{-
if difference between the number of leaves in the left and right subtrees is <= to 1:
    recursively check if the left and right subtrees are balanced.
-}
balanced (Node left right) = abs (leaves left - leaves right) <= 1 && balanced left && balanced right
    where
        -- our function to count the number of leaves in a tree
        leaves :: Tree -> Int
        leaves (Leaf _) = 1
        leaves (Node left right) = leaves left + leaves right

{-
3. Define a function balance :: [Int] -> Tree that converts a non-
empty list of integers into a balanced tree. 
(Hint: by using the function splitAt :: Int -> [a] -> ([a], [a]), 
define a function that splits a list into two halves whose lengthes differ by at most one.)
-}
balance :: [Int] -> Tree
balance [x] = Leaf x
balance xs = Node (balance left) (balance right)
    where
        -- split the list into two halves, whose lengths differ by at most 1
        (left, right) = splitAt (length xs `div` 2) xs

{-
4. (Hard and optional) Nim is a game that is played by two players on
a board comprising five numbered rows of stars, which is initially set
up as follows:
1: * * * * *
2: * * * *
3: * * *
4: * *
5: *
Two players take it in turn to remove one or more stars from the end
of a single row. The winner is the player who removes the last star or
stars from the board.
Implement the game of nim in Haskell. 
(Hint: Represent the board as a list of five integers that 
give the number of stars remaining on each row. 
For example, the initial board is [5,4,3,2,1].)
-}



