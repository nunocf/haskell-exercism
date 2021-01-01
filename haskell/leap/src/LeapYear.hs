module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = div4 && (not div100 || div400)
  where
    div4 = year `rem` 4 == 0
    div100 = year `rem` 100 == 0
    div400 = year `rem` 400 == 0
