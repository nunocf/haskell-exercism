module Robot (
    Bearing (East, North, South, West),
    bearing,
    coordinates,
    mkRobot,
    move,
) where

import Data.List (foldl')

data Bearing
    = North
    | East
    | South
    | West
    deriving (Eq, Show, Enum)

data Robot = Robot
    { bearing :: Bearing
    , coordinates :: (Integer, Integer)
    }

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move = foldl' applyInstruction

applyInstruction :: Robot -> Char -> Robot
applyInstruction robot 'L' = turnLeft robot
applyInstruction robot 'R' = iterate turnLeft robot !! 3
applyInstruction robot 'A' = advance robot
applyInstruction robot _ = robot

turnLeft :: Robot -> Robot
turnLeft (Robot North p) = Robot West p
turnLeft (Robot b p) = Robot (pred b) p

advance :: Robot -> Robot
advance (Robot North (x, y)) = Robot North (x, y + 1)
advance (Robot West (x, y)) = Robot West (x - 1, y)
advance (Robot South (x, y)) = Robot South (x, y - 1)
advance (Robot East (x, y)) = Robot East (x + 1, y)
