module Luhn (isValid) where

import Data.Char (digitToInt, isDigit)

isValid :: String -> Bool
isValid n
    | length luhn < 2 = False
    | otherwise = sum luhn `rem` 10 == 0
  where
    luhn = normDigits . dupeOdd . reverse . digitL $ n

digitL :: String -> [Int]
digitL = map digitToInt . filter isDigit

dupeOdd :: [Int] -> [Int]
dupeOdd = zipWith (*) $ cycle [1, 2]

normDigits :: [Int] -> [Int]
normDigits = map $ subGT 9

subGT :: Int -> Int -> Int
subGT x v
    | v <= x = v
    | otherwise = v - x
