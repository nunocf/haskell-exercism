module SecretHandshake (handshake) where

import Data.Bits

handshake :: Int -> [String]
handshake n
    | n <= 0 = []
    | testBit n 4 = reverse . handshake $ clearBit n 4
    | testBit n 0 = "wink" : handshake (clearBit n 0)
    | testBit n 1 = "double blink" : handshake (clearBit n 1)
    | testBit n 2 = "close your eyes" : handshake (clearBit n 2)
    | testBit n 3 = "jump" : handshake (clearBit n 3)
    | otherwise = handshake (n `div` 2)
