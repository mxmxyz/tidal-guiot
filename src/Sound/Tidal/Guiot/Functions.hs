module Sound.Tidal.Guiot.Functions where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords
import Sound.Tidal.Utils

import Sound.Tidal.Guiot.Utils

--shrand, to allow for non-syncing randomness
shrand n = (fast (1.453^n) $ rand)

--scaleshift, to use a scale and +/- by n degrees 
shiftscale scale n p = scale ((+ n) <$> p)

--rot aliases
shiftl n p = (rotL n) $ p
shiftr n p = (rotR n) $ p
rotl n p = (rotL n) $ p
rotr n p = (rotR n) $ p

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

--transup and transdown (j for JI)
transup n p = (|+ note n) $ p
transdown n p = (|- note n) $ p
jtransup n p = (|* note n) $ p
jtransdown n p = (|* note (1/n)) $ p

--ampl
ampl n p = (|* gain n) $ p

--safe filters
safety p = (min 22000) <$> p

--paliWith
paliWith :: a -> [a] -> [a]
paliWith n l = l ++ [n] ++ reverse l

makeStruct :: Foldable t => Int -> t Int -> Pattern Bool
makeStruct steps = fromList . indexElem steps

superLayer :: Pattern Double -> Pattern Int -> Pattern ControlMap -> Pattern ControlMap 
superLayer d n = stutWith n 0 (|+ note d)

