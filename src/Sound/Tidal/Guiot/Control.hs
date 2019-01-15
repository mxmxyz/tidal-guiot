module Sound.Tidal.Guiot.Control where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

-- parameters for SuperDirt synths
ringfreq, ringmod, ringenv :: Pattern Double -> ControlPattern
ringfreq = pF "ringfreq"
ringmod = pF "ringmod"
ringenv = pF "ringenv"
