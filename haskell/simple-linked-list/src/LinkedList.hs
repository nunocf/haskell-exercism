module LinkedList
  ( LinkedList,
    datum,
    fromList,
    isNil,
    new,
    next,
    nil,
    reverseLinkedList,
    toList,
  )
where

data LinkedList a
  = LinkedList {datum :: a, next :: LinkedList a}
  | End
  deriving (Eq, Show)

instance Foldable LinkedList where
  foldr _ acc End = acc
  foldr f acc (LinkedList v r) =
    f v (foldr f acc r)

isNil :: LinkedList a -> Bool
isNil End = True
isNil _ = False

fromList :: [a] -> LinkedList a
fromList = foldr new nil

toList :: LinkedList a -> [a]
toList = foldr (:) []

new :: a -> LinkedList a -> LinkedList a
new = LinkedList

nil :: LinkedList a
nil = End

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = foldl (flip new) nil
