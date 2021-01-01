module Minesweeper (annotate) where

import Data.Char (intToDigit)

type Board = [String]

annotate :: Board -> Board
annotate board = zipWith (annotateLine board) [0 ..] board

annotateLine :: Board -> Int -> String -> String
annotateLine board y line =
    zipWith (annotateChar board y) [0 ..] line

annotateChar :: Board -> Int -> Int -> Char -> Char
annotateChar _ _ _ '*' = '*'
annotateChar board y x _
    | countAdjacentMines (x, y) board == 0 = ' '
    | otherwise = intToDigit . countAdjacentMines (x, y) $ board

countAdjacentMines :: (Int, Int) -> Board -> Int
countAdjacentMines coord board =
    length . filter (== Just '*') . map (findElem board) . adjacentPositions $ coord

adjacentPositions :: (Int, Int) -> [(Int, Int)]
adjacentPositions (x, y) =
    [(i, j) | i <- [(x -1) .. (x + 1)], j <- [(y -1) .. (y + 1)], (i, j) /= (x, y)]

findElem :: Board -> (Int, Int) -> Maybe Char
findElem board (x, y)
    | x < 0 = Nothing
    | x > (length . head $ board) - 1 = Nothing
    | y < 0 = Nothing
    | y > (length board) - 1 = Nothing
    | otherwise = Just $ (board !! y) !! x
