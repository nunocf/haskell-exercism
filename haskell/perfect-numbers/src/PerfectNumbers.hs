module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
    | x <= 0 = Nothing
    | otherwise = case compare x . sum . factors $ x of
        LT -> Just Abundant
        GT -> Just Deficient
        EQ -> Just Perfect

factors :: Int -> [Int]
factors x = [a | a <- [1 .. x `div` 2], x `mod` a == 0]
