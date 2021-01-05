module Change (findFewestCoins) where

import Data.List (tails)
import Data.Maybe (listToMaybe)

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins = listToMaybe solutions
  where
    solutions = filter (\s -> sum s == target) combinations
    combinations = [0 .. target `div` minimum coins] >>= allCombinations coins

allCombinations :: [Integer] -> Integer -> [[Integer]]
allCombinations _ 0 = [[]]
allCombinations xs n = [t0 : rest | t@(t0 : _) <- tails xs, rest <- allCombinations t (n -1)]
