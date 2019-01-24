module Sound.Tidal.Guiot.Control where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

-- parameters for SuperDirt synths
upbound, lobound, shaped, lopf, lopq, ringfreq, ringmod, ringenv :: Pattern Double -> ControlPattern
ringfreq = pF "ringfreq"
ringmod = pF "ringmod"
ringenv = pF "ringenv"
lopf = pF "lopf"
lopq = pF "lopq"
shaped = pF "shaped"
upbound = pF "upbound"
lobound = pF "lobound"
