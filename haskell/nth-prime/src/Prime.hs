module Prime (nth) where

-- I understand the type signature demands it, but
-- why do we need an Integer, instead of Int for the result?
nth :: Int -> Maybe Integer
nth n =
  case getPrimes n of
    [] -> Nothing
    list -> Just $ toInteger $ last list

getPrimes :: Int -> [Int]
getPrimes n =
  take n $ filter isPrime (2 : [3, 5 ..])

-- If n is divisable only by itself (and 1), it's prime.
-- 1 is not prime.

isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n =
  all (\v -> n `mod` v /= 0) $ possibleRange n

-- skipping even numbers, to try and make this faster.
possibleRange :: Int -> [Int]
possibleRange n = 2 : [3, 5 .. n - 1]
