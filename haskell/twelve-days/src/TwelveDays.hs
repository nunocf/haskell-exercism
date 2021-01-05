module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop = map verse [start .. stop]

verse :: Int -> String
verse n = unwords $ prelist n ++ map item [n, (n -1) .. 1]

prelist :: Int -> [String]
prelist n = ["On the", ordinal n, "day of Christmas my true love gave to me:"]

ordinal :: Int -> String
ordinal 1 = "first"
ordinal 2 = "second"
ordinal 3 = "third"
ordinal 4 = "fourth"
ordinal 5 = "fifth"
ordinal 6 = "sixth"
ordinal 7 = "seventh"
ordinal 8 = "eighth"
ordinal 9 = "ninth"
ordinal 10 = "tenth"
ordinal 11 = "eleventh"
ordinal 12 = "twelfth"
ordinal _ = ""

item :: Int -> String
item 1 = "a Partridge in a Pear Tree."
item 2 = "two Turtle Doves, and"
item 3 = "three French Hens,"
item 4 = "four Calling Birds,"
item 5 = "five Gold Rings,"
item 6 = "six Geese-a-Laying,"
item 7 = "seven Swans-a-Swimming,"
item 8 = "eight Maids-a-Milking,"
item 9 = "nine Ladies Dancing,"
item 10 = "ten Lords-a-Leaping,"
item 11 = "eleven Pipers Piping,"
item 12 = "twelve Drummers Drumming,"
item _ = ""
