module BST (
    BST,
    bstLeft,
    bstRight,
    bstValue,
    empty,
    fromList,
    insert,
    singleton,
    toList,
) where

import qualified Data.Foldable as F

data BST a
    = Empty
    | Node a (BST a) (BST a)
    deriving (Eq, Show)

instance Functor BST where
    fmap _ Empty = Empty
    fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

instance F.Foldable BST where
    foldMap _ Empty = mempty
    foldMap f (Node v l r) =
        F.foldMap f l
            `mappend` f v
            `mappend` F.foldMap f r

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (Node _ left _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (Node _ _ right) = Just right

bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue (Node a _ _) = Just a

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList [] = Empty
fromList xs = foldl (flip insert) Empty xs

insert :: Ord a => a -> BST a -> BST a
insert x Empty = singleton x
insert x (Node v left right)
    | x <= v = Node v (insert x left) right
    | otherwise = Node v left (insert x right)

singleton :: a -> BST a
singleton x = Node x Empty Empty

toList :: BST a -> [a]
toList = F.foldMap (: [])
