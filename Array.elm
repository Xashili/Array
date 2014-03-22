module Array where

{-| A library for manipulating arrays of values. Every value in a
array must have the same type. The arrays are implemented in Relaxed
Radix Balanced-Trees for fast updating and concating.

# Basics
@docs empty, length, get

# Putting Arrays Together
@docs fromList, concat, push, set

# Taking Arrays Apart
@docs toList, slice
-}

import Basics (..)
import Native.Array

data Array a = Array

{-| Creates an array from a list. -}
fromList : [a] -> Array a
fromList = foldl (Native.Array.push) Native.Array.empty

{-| Creates a list from an array -}
toList : Array a -> [a]
toList = Native.Array.toList

{-| Returns an empty array. -}
empty : Array a
empty = Native.Array.empty

{-| Pushes an item to the end of an array. -}
push : a -> Array a -> Array a
push = Native.Array.push

{-| Returns the value at an index of an array. -}
get : Int -> Array a -> a
get = Native.Array.get

{-| Sets the value at at an index. Returns the updated array. -}
set : Int -> a -> Array a -> Array a
set = Native.Array.set

{-| Slices an array given a selection with both Ints. The selection is 
inclusive, so the last element in the selection will also be in the new
array. This may change in the future.
You can select from the end by giving a negative Int. -}
slice : Int -> Int -> Array a -> Array a
slice = Native.Array.slice

{-| Returns the length of an array. -}
length : Array a -> Int
length = Native.Array.length

{-| Concats to arrays to a new one. -}
concat : Array a -> Array a -> Array a
concat = Native.Array.concat
