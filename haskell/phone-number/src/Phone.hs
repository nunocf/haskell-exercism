module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number xs
    | length xs == 10 && valid d = Just d
    | length xs == 11 && valid (tail d) = Just $ tail d
    | otherwise = Nothing
  where
    d = filter isDigit xs

valid :: String -> Bool
valid [x, _, _, x2, _, _, _, _, _, _] = all (`notElem` ['0', '1']) [x, x2]
valid ['1', x, _, _, x2, _, _, _, _, _, _] = all (`notElem` ['0', '1']) [x, x2]
valid _ = False
