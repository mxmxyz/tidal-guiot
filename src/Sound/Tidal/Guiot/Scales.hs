module Sound.Tidal.Guiot.Scales where

import Data.List
import Data.Fixed

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords
import Sound.Tidal.Utils
import Sound.Tidal.Guiot.Utils

-- | toScale for JI scales

jtoScale' :: (Num a) => a -> [a] -> Pattern Int -> Pattern a
jtoScale' _ [] = const silence
jtoScale' o s = fmap noteInScale
  where octave x = x `div` length s
        noteInScale x = (s !!! x) * (o ^ octave x)

jtoScale scale = jtoScale' 2 scale


jrowHalf :: (Fractional a, Ord a) => a -> Int -> [a]
jrowHalf interval n = map jnorm $ scanl (*) 1 $ replicate n interval

-- | creates a row
jrow :: (Fractional a, Ord a) => a -> Int -> Int -> [a]
jrow interval right left = sort ((tail (jrowHalf interval right)) ++ jrowHalf (1 / interval) left)

{- | creates a 2-intervals matrix of rational intervals and sorts it from lowest to highest.

@
jmat2 (3,2,2) (5,1,1) :: [Rational]
@
-}
jmat2 :: (Fractional a, Ord a) => (a, Int, Int) -> (a, Int, Int) -> [a]
jmat2 (int1, r1, l1) (int2, r2, l2) = sort (removeDuplicates (map jnorm ([x * y | x <- (jrow int1 r1 l1), y <- (jrow int2 r2 l2)])))

-- | moments of symmetry
mos :: Int -> Int -> Int -> [Int]
mos notes interval scale = take notes $ iterate ((`mod` scale) . (+ interval)) 0


---premade scales

--53EDO

-- | a 'superchromatic' (21 notes) scale in 53-EDO

superchromatic53 :: Num a => Pattern Int -> Pattern a
superchromatic53 = toScale' 53 [0, 3, 5, 9, 12, 14, 17, 19, 20, 22, 26, 27, 31, 34, 36, 39, 43, 45, 48, 50, 51]

--JI

-- | 'classic' chromatic scale in 5-limit intonation

chromatic5l :: (Num a, Fractional a) => Pattern Int -> Pattern a
chromatic5l = jtoScale [1, (16/15), (9/8), (6/5), (5/4), (4/3), (25/18), (3/2), (8/5), (5/3), (9/5), (15/8)]

-- commas

commaPythagorean = 531441 / 524288
commaSyntonic = 81/80
commaSeptimal = 64/63
commaBiyatisma = 121/120
