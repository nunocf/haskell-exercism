module House (rhyme) where

import Data.List

songParts :: [(String, String)]
songParts =
  [ ("lay in", "house that Jack built.\n"),
    ("ate", "malt"),
    ("killed", "rat"),
    ("worried", "cat"),
    ("tossed", "dog"),
    ("milked", "cow with the crumpled horn"),
    ("kissed", "maiden all forlorn"),
    ("married", "man all tattered and torn"),
    ("woke", "priest all shaven and shorn"),
    ("kept", "rooster that crowed in the morn"),
    ("belonged to", "farmer sowing his corn"),
    ("", "horse and the hound and the horn")
  ]

rhyme :: String
rhyme = intercalate "\n" . sections $ drop 1 $ inits songParts

sections :: [[(String, String)]] -> [String]
sections = map (intercalate "\n" . section . reverse)

section :: [(String, String)] -> [String]
section [] = []
section (x : xs) = firstVerse x : map verse xs

firstVerse :: (String, String) -> String
firstVerse (_, b) = unwords ["This is the", b]

verse :: (String, String) -> String
verse (a, b) = unwords ["that", a, "the", b]
