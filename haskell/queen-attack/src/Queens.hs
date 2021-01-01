module Queens (boardString, canAttack) where

import Data.List

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines . map (intersperse ' ') $ boardCoords
  where
    boardCoords = [[placeChar (x, y) | y <- [0 .. 7]] | x <- [0 .. 7]]
    placeChar p
        | Just p == white = 'W'
        | Just p == black = 'B'
        | otherwise = '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x1, y1) (x2, y2)
    | x1 == x2 || y1 == y2 = True
    | abs (y2 - y1) == abs (x2 - x1) = True
    | otherwise = False
