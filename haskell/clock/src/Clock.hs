module Clock (addDelta, fromHourMin, toString) where

import Text.Printf

data Clock = Clock Int Int
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock hours minutes
 where
  (carryOver, minutes) = toMinute m
  hours = toHour $ h + carryOver

toString :: Clock -> String
toString (Clock h m) = printf "%02d:%02d" h m

addDelta :: Int -> Int -> Clock -> Clock
addDelta dh dm (Clock h m) = fromHourMin newHour newMin
 where
  newHour = h + dh
  newMin = m + dm

toHour :: Int -> Int
toHour h = h `mod` 24

-- returns minutes + hour carryover if something bigger than 59 is passed
toMinute :: Int -> (Int, Int)
toMinute m = m `divMod` 60
