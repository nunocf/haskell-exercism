module Counting (
  Color (..),
  territories,
  territoryFor,
) where

import Data.Ix (range)
import Data.List (nub)
import Data.Maybe (fromMaybe, isJust, mapMaybe)
import Data.Set (Set)
import qualified Data.Set as S

data Color = Black | White deriving (Eq, Ord, Show)
type Coord = (Int, Int)
type Board = [String]
data Border = Inclusive | Exclusive deriving (Eq, Show)

territories :: Board -> [(Set Coord, Maybe Color)]
territories board = nub $ mapMaybe (territoryFor board) coords
 where
  coords = range ((1, 1), (length . head $ board, length board))

territoryFor :: Board -> Coord -> Maybe (Set Coord, Maybe Color)
territoryFor board coord
  | not (inBounds board coord) = Nothing
  | otherwise = findTerritory board coord

findTerritory :: Board -> Coord -> Maybe (Set Coord, Maybe Color)
findTerritory board coord
  | isJust v = Nothing
  | otherwise = Just (territory, owner)
 where
  v = getValue board coord
  territory = findBorder board S.empty Exclusive coord
  owner = findOwner board (findBorder board S.empty Inclusive coord)

findBorder :: Board -> Set Coord -> Border -> Coord -> Set Coord
findBorder b visited border coord
  | isJust value && border == Inclusive = S.singleton coord
  | isJust value && border == Exclusive = S.empty
  | otherwise = S.union (S.singleton coord) rest
 where
  value = getValue b coord
  adj = fromMaybe S.empty $ findNeigbours b coord
  newVisited = S.unions [visited, unvisitedAdj]
  unvisitedAdj = S.filter (`S.notMember` visited) adj
  rest = S.unions $ map (findBorder b newVisited border) $ S.toList unvisitedAdj

findNeigbours :: Board -> Coord -> Maybe (Set Coord)
findNeigbours board coord
  | not (inBounds board coord) = Nothing
  | otherwise = Just $ S.fromList neighbours
 where
  neighbours = filter (inBounds board) $ [top, right, bottom, left] <*> pure coord

top :: Coord -> Coord
top (x, y) = (x, pred y)

left :: Coord -> Coord
left (x, y) = (pred x, y)

right :: Coord -> Coord
right (x, y) = (succ x, y)

bottom :: Coord -> Coord
bottom (x, y) = (x, succ y)

findOwner :: Board -> Set Coord -> Maybe Color
findOwner board coords
  | hasEmpty && hasWhite && all (`elem` [Nothing, Just White]) values = Just White
  | hasEmpty && hasBlack && all (`elem` [Nothing, Just Black]) values = Just Black
  | otherwise = Nothing
 where
  hasEmpty = Nothing `elem` values
  hasWhite = Just White `elem` values
  hasBlack = Just Black `elem` values
  values = map (getValue board) $ S.toAscList coords

getValue :: Board -> Coord -> Maybe Color
getValue board (x, y)
  | v == 'W' = Just White
  | v == 'B' = Just Black
  | otherwise = Nothing
 where
  v = (board !! (y -1)) !! (x -1)

inBounds :: Board -> Coord -> Bool
inBounds board (x, y)
  | x < minX || y < minY || x > maxX || y > maxY = False
  | otherwise = True
 where
  ((minX, minY), (maxX, maxY)) = getBounds board

getBounds :: Board -> (Coord, Coord)
getBounds board = ((1, 1), (length . head $ board, length board))
