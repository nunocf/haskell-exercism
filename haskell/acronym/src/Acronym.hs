module Acronym (abbreviate) where

import Data.Char (isAlpha, isLower, isSpace, isUpper, toLower, toUpper)

import Data.List (groupBy)
import Data.List.Split (wordsBy)

abbreviate :: String -> String
abbreviate = map (toUpper . head) . wordsBy isDelim . unwords . map (capitalise . splitCamel) . words . filter isValidChar

splitCamel :: String -> String
splitCamel = unwords . groupBy (\x y -> (isUpper x && isLower y) || isLower x && isLower y)

capitalise :: [Char] -> [Char]
capitalise x = toUpper (head x) : (toLower <$> tail x)

isDelim :: Char -> Bool
isDelim = or . sequence [isSpace, (== '-')]

isValidChar :: Char -> Bool
isValidChar = or . sequence [isSpace, (== '-'), (== '\''), isAlpha]
