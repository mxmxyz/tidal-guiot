module Sound.Tidal.Guiot.Scales where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

superchromatic53 :: Num a => Pattern Int -> Pattern a
superchromatic53 = toScale' 53 [0, 3, 5, 9, 12, 14, 17, 19, 20, 22, 26, 27, 31, 34, 36, 39, 43, 45, 48, 50, 51]

chromatic5l :: (Num a, Fractional a) => Pattern Int -> Pattern a
chromatic5l = toScale' 1 [1, (16/15), (9/8), (6/5), (5/4), (4/3), (25/18), (3/2), (8/5), (5/3), (9/5), (15/8)]
