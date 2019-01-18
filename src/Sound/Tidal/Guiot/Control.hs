module Sound.Tidal.Guiot.Control where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

-- parameters for SuperDirt synths
lopf, lopq, ringfreq, ringmod, ringenv :: Pattern Double -> ControlPattern
ringfreq = pF "ringfreq"
ringmod = pF "ringmod"
ringenv = pF "ringenv"
lopf = pF "lopf"
lopq = pF "lopq"
