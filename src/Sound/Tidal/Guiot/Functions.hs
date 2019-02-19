module Sound.Tidal.Guiot.Functions where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

--courtesy of yaxu
wrap s e p = (p |% (e - s)) |+ s
