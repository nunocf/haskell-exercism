{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char (isAlpha, isUpper)
import Data.Text (Text)
import qualified Data.Text as T

responseFor :: Text -> Text
responseFor xs
  | isSilence n = "Fine. Be that way!"
  | isQuestion n && isShout alpha = "Calm down, I know what I'm doing!"
  | isQuestion n = "Sure."
  | isShout alpha = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    n = T.strip xs
    alpha = T.filter isAlpha n
    isQuestion = T.isSuffixOf "?"
    isShout t = (not . T.null) t && T.all isUpper t
    isSilence t = T.null t
