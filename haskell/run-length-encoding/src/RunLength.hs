module RunLength (decode, encode) where

import Data.Char (isDigit)
import Data.List

decode :: String -> String
decode "" = ""
decode s = replicate n c ++ decode cs
  where
    (number, c : cs) = span isDigit s
    n = if null number then 1 else read number

encode :: String -> String
encode = concatMap encStr . group
  where
    encStr [c] = [c]
    encStr x = show (length x) ++ take 1 x
