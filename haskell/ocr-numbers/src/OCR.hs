module OCR (convert) where

import Data.List
import Data.List.Split

convert :: String -> String
convert = intercalate "," . map convertRow . (chunksOf 4 . lines)

convertRow :: [String] -> String
convertRow = map parseDigit . transpose . map (chunksOf 3)

parseDigit :: [String] -> Char
parseDigit [" _ ", "| |", "|_|", "   "] = '0'
parseDigit ["   ", "  |", "  |", "   "] = '1'
parseDigit [" _ ", " _|", "|_ ", "   "] = '2'
parseDigit [" _ ", " _|", " _|", "   "] = '3'
parseDigit ["   ", "|_|", "  |", "   "] = '4'
parseDigit [" _ ", "|_ ", " _|", "   "] = '5'
parseDigit [" _ ", "|_ ", "|_|", "   "] = '6'
parseDigit [" _ ", "  |", "  |", "   "] = '7'
parseDigit [" _ ", "|_|", "|_|", "   "] = '8'
parseDigit [" _ ", "|_|", " _|", "   "] = '9'
parseDigit _ = '?'
