module SpaceAge (Planet (..), ageOn) where

data Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune

ageOn :: Planet -> Float -> Float
ageOn p seconds = seconds / (toEarthYears p * earthYearInSeconds)

toEarthYears :: Planet -> Float
toEarthYears Mercury = 0.2408467
toEarthYears Venus = 0.61519726
toEarthYears Earth = 1
toEarthYears Mars = 1.8808158
toEarthYears Jupiter = 11.862615
toEarthYears Saturn = 29.447498
toEarthYears Uranus = 84.016846
toEarthYears Neptune = 164.79132

earthYearInSeconds :: Float
earthYearInSeconds = 31557600
