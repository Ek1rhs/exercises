{- |
Module                  : Lecture1
Copyright               : (c) 2021-2022 Haskell Beginners 2022 Course
SPDX-License-Identifier : MPL-2.0
Maintainer              : Haskell Beginners 2022 Course <haskell.beginners2022@gmail.com>
Stability               : Stable
Portability             : Portable

Exercises for the Lecture 1 of the Haskell Beginners course.

To complete exercises, you need to complete implementation and add
missing top-level type signatures. You can implement any additional
helper functions. But you can't change the names of the given
functions.

Comments before each function contain explanations and example of
arguments and expected returned values.

It's absolutely okay if you feel that your implementations are not
perfect. You can return to these exercises after future lectures and
improve your solutions if you see any possible improvements.
-}

module Lecture1
    ( makeSnippet
    , sumOfSquares
    , lastDigit
    , minmax
    , subString
    , helper
    , strSum
    , greater
    , lowerAndGreater
    , lower
    ) where

-- VVV If you need to import libraries, do it after this line ... VVV

-- ^^^ and before this line. Otherwise the test suite might fail  ^^^

{- | Specify the type signature of the following function. Think about
its behaviour, possible types for the function arguments and write the
type signature explicitly.
-}
makeSnippet :: Int -> [Char] -> [Char]
makeSnippet limit text = take limit ("Description: " ++ text) ++ "..."

{- | Implement a function that takes two numbers and finds sum of
their squares.

Explanation: @sumOfSquares 3 4@ should be equal to @9 + 16@ and this
is 25.
-}
-- DON'T FORGET TO SPECIFY THE TYPE IN HERE
sumOfSquares :: Int -> Int -> Int
sumOfSquares x y = (x * x) + (y * y)

{- | Implement a function that returns the last digit of a given number.

>>> lastDigit 42
WAS 2
NOW lastDigit: Not implemented!
>>> lastDigit (-17)
WAS 7
NOW lastDigit: Not implemented!

🕯 HINT: use the @mod@ function

-}
-- DON'T FORGET TO SPECIFY THE TYPE IN HERE

lastDigit :: Integer -> Integer 
lastDigit x | (x >= 0) = mod x 10
            | (x < 0)  = (-1) * (mod (x) (-10))


{- | Write a function that takes three numbers and returns the
difference between the biggest number and the smallest one.

>>> minmax 7 1 4
6

Explanation: @minmax 7 1 4@ returns 6 because 7 is the biggest number
and 1 is the smallest, and 7 - 1 = 6.

Try to use local variables (either let-in or where) to implement this
function.
-}
minmax :: Integer -> Integer -> Integer -> Integer 
minmax x y z = (max x (max y z) )- (min x (min y z) )


{- | Implement a function that takes a string, start and end positions
and returns a substring of a given string from the start position to
the end (including).

>>> subString 3 7 "Hello, world!"
"lo, w"

>>> subString 10 5 "Some very long String"
""

This function can accept negative start and end position. Negative
start position can be considered as zero (e.g. substring from the
first character) and negative end position should result in an empty
string.
-}

{-
subString :: Int -> Int -> String  -> String
subString start end str | (start <= 0) && (end >= 0) = take (end +1) str
                        | (start > 0) && (end <= 0) = []
                        | (start < 0) && (end < 0)  = []
                        | otherwise                 = take ((end +1) - start )(drop start str)
-}
subString :: Int -> Int -> [a] -> [a]
subString start end | end < 0 = const []
                    | otherwise = take (end - max 0 start + 1) . drop start

    
{- | Write a function that takes a String — space separated numbers,
and finds a sum of the numbers inside this string.

>>> strSum "100    -42  15"
73

The string contains only spaces and/or numbers.
-}
helper:: [Char] -> [Int] 
helper arr= map read $ words arr 


strSum :: [Char] -> Int 
strSum arr = sum $ helper arr


{- | Write a function that takes a number and a list of numbers and
returns a string, saying how many elements of the list are strictly
greated than the given number and strictly lower.

>>> lowerAndGreater 3 [1 .. 9]
"3 is greater than 2 elements and lower than 6 elements"

Explanation: the list [1 .. 9] contains 9 elements: [1, 2, 3, 4, 5, 6, 7, 8, 9]
The given number 3 is greater than 2 elements (1 and 2)
and lower than 6 elements (4, 5, 6, 7, 8 and 9).

🕯 HINT: Use recursion to implement this function.
-}
greater :: Int -> [Int] -> Int
greater n arr = length $ filter (<n) arr  

lower :: Int -> [Int] -> Int
lower n arr = length $ filter (>n) arr  

lowerAndGreater :: Int -> [Int] -> String
lowerAndGreater n arr = ( show n ) ++ " is greater than " ++(show ( greater n arr )) ++ " elements and lower than " ++ (show ( lower n arr)) ++ " elements"



    -- ( show b ) ++ "s greater than " ++ ( lower n arr )++ " elements"

--lowerAndGreater n list = 

--0 is greater than 5 elements and lower than 0 elements"