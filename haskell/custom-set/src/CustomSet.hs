module CustomSet
  ( CustomSet,
    empty,
    fromList,
    difference,
    isDisjointFrom,
    null,
    intersection,
    insert,
    delete,
    isSubsetOf,
    member,
    union,
    size,
    toList,
  )
where

import Data.List (foldl')
import Prelude hiding (null)

data CustomSet a
  = Empty
  | CustomSet (CustomSet a) a (CustomSet a)
  deriving (Show)

instance Eq a => Eq (CustomSet a) where
  Empty == Empty = True
  (CustomSet l v r) == (CustomSet l2 v2 r2) =
    l == l2 && v == v2 && r == r2
  _ == _ = False

empty :: CustomSet a
empty = Empty

fromList :: Ord a => [a] -> CustomSet a
fromList = foldr insert Empty

difference :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
difference setA setB = fromList $ filter (not . (`member` setB)) $ toList setA

isDisjointFrom :: Ord a => CustomSet a -> CustomSet a -> Bool
isDisjointFrom as bs = (not . any (`member` bs)) $ toList as

null :: Ord a => CustomSet a -> Bool
null = (== Empty)

intersection :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
intersection as = fromList . filter (`member` as) . toList

insert :: Ord a => a -> CustomSet a -> CustomSet a
insert x Empty = CustomSet Empty x Empty
insert x s@(CustomSet l v r) = case compare x v of
  EQ -> s
  LT -> CustomSet (insert x l) v r
  GT -> CustomSet l v (insert x r)

delete :: Ord a => a -> CustomSet a -> CustomSet a
delete _ Empty = Empty
delete x (CustomSet l v r) = case compare x v of
  LT -> CustomSet (delete x l) v r
  GT -> CustomSet l v (delete x r)
  EQ -> case l of
    CustomSet _ v' _ -> CustomSet (delete v' l) v' r
    _ -> r

isSubsetOf :: Ord a => CustomSet a -> CustomSet a -> Bool
isSubsetOf as bs = all (`member` bs) $ toList as

member :: Ord a => a -> CustomSet a -> Bool
member _ Empty = False
member x (CustomSet l v r) = case compare x v of
  EQ -> True
  LT -> member x l
  GT -> member x r

union :: Ord a => CustomSet a -> CustomSet a -> CustomSet a
union xs = foldl' (flip insert) xs . toList

size :: CustomSet a -> Int
size = length . toList

toList :: CustomSet a -> [a]
toList Empty = []
toList (CustomSet l v r) = toList l ++ (v : toList r)
