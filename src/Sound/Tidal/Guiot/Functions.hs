module Sound.Tidal.Guiot.Functions where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

--courtesy of yaxu
wrap s e p = (p |% (e - s)) |+ s

--yes and gtfo (n was taken)
yes = degradeBy 0
y = degradeBy 0
gtfo = degradeBy 1
g = degradeBy 1
