module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (delete)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs wls = filter (isAnagram xsLower) filteredWls
  where
    xsLower = toLowerS xs
    filteredWls = filter (diffLower xsLower) wls

isAnagram :: String -> String -> Bool
isAnagram [] _test = False
isAnagram _base [] = False
isAnagram [b] [t] = b == t
isAnagram bs ts
    | t `elem` bs = isAnagram (delete t bs) tss
    | otherwise = False
  where
    (t : tss) = toLowerS ts

toLowerS :: String -> String
toLowerS = map toLower

diffLower :: String -> String -> Bool
diffLower a b = a /= toLowerS b
