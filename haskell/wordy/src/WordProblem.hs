module WordProblem (answer) where

import Data.Functor
import Text.Parsec

answer :: String -> Maybe Integer
answer problem =
    either (const Nothing) Just (parse myParser "" problem)

myParser :: Parsec String () Integer
myParser = between (string "What is" >> spaces) (string "?" >> eof) (chainl1 integer operator)

operator :: Parsec String () (Integer -> Integer -> Integer)
operator = spaces *> operations <* spaces

operations :: Parsec String () (Integer -> Integer -> Integer)
operations =
    op "plus" (+)
        <|> op "minus" (-)
        <|> op "multiplied by" (*)
        <|> op "divided by" div

op :: String -> (Integer -> Integer -> Integer) -> Parsec String () (Integer -> Integer -> Integer)
op s f = try $ string s $> f

integer :: Parsec String () Integer
integer = (read :: String -> Integer) <$> (plus <|> minus <|> number)
  where
    plus = char '+' *> number
    minus = (:) <$> char '-' <*> number
    number = many1 digit
