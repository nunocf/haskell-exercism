module WordCount (wordCount) where

import Data.Char (isAlphaNum, toLower)
import qualified Data.Map as Map

wordCount :: String -> [(String, Int)]
wordCount xs = Map.toList $ Map.fromListWith (+) $ zip wl $ repeat 1
 where
  wl = map (removeQuotes . map toLower) . words . map replacePunct $ xs

replacePunct :: Char -> Char
replacePunct c = if isAlphaNum c || c == '\'' then c else ' '

removeQuotes :: String -> String
removeQuotes word
  | head word == '\'' && (last word == '\'') = init $ tail word
  | otherwise = word
