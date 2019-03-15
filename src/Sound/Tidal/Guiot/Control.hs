module Sound.Tidal.Guiot.Control where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

-- parameters for SuperDirt synths
upbound, lobound, shaped, lopf, lopq, ringfreq, ringmod, ringenv, tuning :: Pattern Double -> ControlPattern
ringfreq = pF "ringfreq"
ringmod = pF "ringmod"
ringenv = pF "ringenv"
lopf = pF "lopf"
lopq = pF "lopq"
shaped = pF "shaped"
upbound = pF "upbound"
lobound = pF "lobound"
tuning = pF "tuning"
pitchenv = pF "pitchenv"
pitchval = pF "pitchval"
bandpf = pF "bandpf"
bandpq = pF "bandpq"
timescale = pF "timescale"
envcurve = pF "envcurve"

-- for "\balloon" SynthDef
notea, noteb, notec, noted, envab, envbc, envcd, bandpfa, bandpfb, bandpfc, bandpqa, bandpqb, bandpqc :: Pattern Double -> ControlPattern
notea = pF "notea"
noteb = pF "noteb"
notec = pF "notec"
noted = pF "noted"
envab = pF "envab"
envbc = pF "envbc"
envcd = pF "envcd"
bandpfa = pF "bandpfa"
bandpfb = pF "bandpfb"
bandpfc = pF "bandpfc"
bandpqa = pF "bandpqa"
bandpqb = pF "bandpqb"
bandpqc = pF "bandpqc"
bandpga = pF "bandpga"
bandpgb = pF "bandpgb"
bandpgc = pF "bandpgc"
