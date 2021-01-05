module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
    | length xs == length ys = Just . length . filter id $ zipWith (/=) xs ys
    | otherwise = Nothing
