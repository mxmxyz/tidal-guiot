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

--shrand, to allow for non-syncing randomness
shrand n = (fast (1.453^n) $ rand)

--scaleshift, to use a scale and +/- by n degrees 
shiftscale scale n p = scale ((+ n) <$> p)
