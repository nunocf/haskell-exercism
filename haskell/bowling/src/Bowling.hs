module Bowling (score, BowlingError (..)) where

data BowlingError
  = IncompleteGame
  | InvalidRoll {rollIndex :: Int, rollValue :: Int}
  deriving (Eq, Show)

score :: [Int] -> Either BowlingError Int
score [] = Left IncompleteGame
score (x : y : z : xs) = if (x + y) == 10 then 10 + (score (2 * z) : xs) else sum rolls
score rolls = Right $ sum rolls
