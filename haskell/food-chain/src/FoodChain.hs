module FoodChain (song) where

song :: String
song =
    unlines . fst $
        foldr
            makeVerses
            ([], [])
            [ ("horse", "She's dead, of course!")
            , ("cow", "I don't know how she swallowed a cow!")
            , ("goat", "Just opened her throat and swallowed a goat!")
            , ("dog", "What a hog, to swallow a dog!")
            , ("cat", "Imagine that, to swallow a cat!")
            , ("bird", "How absurd to swallow a bird!")
            , ("spider", "It wriggled and jiggled and tickled inside her.")
            , ("fly", "")
            ]

makeVerses :: (String, String) -> ([String], [(String, String)]) -> ([String], [(String, String)])
makeVerses animal (s, animalGroup) =
    (s ++ verse (animal : animalGroup), animal : animalGroup)

swallowLine :: String -> String -> String
swallowLine a "spider" =
    "She swallowed the " ++ a ++ " to catch the spider that wriggled and jiggled and tickled inside her."
swallowLine a b =
    "She swallowed the " ++ a ++ " to catch the " ++ b ++ "."

swallowLines :: [String] -> [String]
swallowLines [] = [""]
swallowLines [x] = ["I don't know why she swallowed the " ++ x ++ ". Perhaps she'll die.\n"]
swallowLines ("horse" : _x) = [""]
swallowLines (x : x2 : xs) = swallowLine x x2 : swallowLines (x2 : xs)

verse :: [(String, String)] -> [String]
verse [] = [""]
verse animals@((x, desc) : _xs) =
    filter (/= "") $ [verseStart x, desc] ++ swallowLines (map fst animals)

verseStart :: String -> String
verseStart animal =
    "I know an old lady who swallowed a " ++ animal ++ "."
