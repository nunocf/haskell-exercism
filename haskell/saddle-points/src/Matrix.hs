module Matrix (saddlePoints) where

import Data.Array (Array, assocs, bounds, (!))

saddlePoints :: Array (Int, Int) Int -> [(Int, Int)]
saddlePoints matrix = map fst . filter (isSaddlePoint matrix) $ assocs matrix

isSaddlePoint :: Array (Int, Int) Int -> ((Int, Int), Int) -> Bool
isSaddlePoint matrix ((r, c), v) = v == maxOfRow row && v == minOfColumn column
  where
    row = [((r, p), matrix ! (r, p)) | p <- [minC .. maxC]]
    column = [((p, c), matrix ! (p, c)) | p <- [minR .. maxR]]
    ((minR, minC), (maxR, maxC)) = bounds matrix

maxOfRow :: [((Int, Int), Int)] -> Int
maxOfRow row = maximum (map snd row)

minOfColumn :: [((Int, Int), Int)] -> Int
minOfColumn column = minimum (map snd column)
