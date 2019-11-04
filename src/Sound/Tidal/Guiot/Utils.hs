module Sound.Tidal.Guiot.Utils where

import Sound.Tidal.Context
import Sound.Tidal.Utils

removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates list = remDups list []

remDups :: (Eq a) => [a] -> [a] -> [a]
remDups [] _ = []
remDups (x:xs) list
    | (x `elem` list) = remDups xs list
    | otherwise = x : remDups xs (x:list)

jnormalize :: (Fractional a, Ord a) => a -> a
jnormalize n = jnorm n

jnorm :: (Fractional a, Ord a) => a -> a
jnorm n
    | n < 1 = jnorm (n * 2)
    | n > 2 = jnorm (n / 2)
    | otherwise = n

truthInt :: Bool -> Int
truthInt x
    | x == True = 1
    | x == False = 0

intTruth :: Int -> Bool
intTruth x
    | x == 0 = False
    | otherwise = True

elemInt :: (Eq a, Foldable t) => a -> t a -> Int
elemInt x y = truthInt $ elem x y

indexElem :: Foldable t => Int -> t Int -> [Bool]
indexElem steps list = map (`elem` list) $ enumFromTo 0 steps
