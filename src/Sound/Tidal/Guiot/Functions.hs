module Sound.Tidal.Guiot.Functions where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

--wrap, courtesy of @yaxu
wrap s e p = (p |% (e - s)) |+ s

--shrand, to allow for non-syncing randomness
shrand n = (fast (1.453^n) $ rand)

--scaleshift, to use a scale and +/- by n degrees 
shiftscale scale n p = scale ((+ n) <$> p)

--shiftl and shiftr (clearer <~/~>)
shiftl n p = (n <~) $ p
shiftr n p = (n ~>) $ p

--degradeBy shorthands, courtesy @kindohm
degBy = degradeBy
deg0 = degBy 0.0
deg1 = degBy 0.1
deg2 = degBy 0.2
deg3 = degBy 0.3
deg4 = degBy 0.4
deg5 = degBy 0.5
deg6 = degBy 0.6
deg7 = degBy 0.7
deg8 = degBy 0.8
deg9 = degBy 0.9
mute = degBy 1

--transup and transdown
transup n p = (|+ note n) $ p
transdown n p = (|- note n) $ p
