module Sound.Tidal.Guiot.Scales where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

superchromatic53 :: Num a => Pattern Int -> Pattern a
superchromatic53 = toScale [0, 3, 5, 9, 12, 14, 17, 19, 20, 22, 26, 27, 31, 34, 36, 39, 43, 45, 48, 50, 51]
