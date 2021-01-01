module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n = take n pascal
  where
    pascal = iterate next [1]
    next r = zipWith (+) (0 : r) (r ++ [0])
