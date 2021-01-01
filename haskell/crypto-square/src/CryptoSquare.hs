module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose, unfoldr)

encode :: String -> String
encode xs = unwords . transpose . map (padRight c) . chunks c $ n
 where
  n = map toLower . filter isAlphaNum $ xs
  c = ceiling . sqrt . fromIntegral . length $ n

chunks :: Int -> String -> [String]
chunks n = unfoldr $ \xs ->
  case xs of
    [] -> Nothing
    _ -> Just $ splitAt n xs

padRight :: Int -> String -> String
padRight n s
  | length s < n = s ++ replicate (n - length s) ' '
  | otherwise = s
