# tidal-guiot

TidalCycles control parameters, functions, etc.

## Contents

*Functions.hs*: Functions that I use every once in a while, useful for patterning things around (a bit barren for now).

*Control.hs*: Defining parameters that I need to control my SC synths (repo for that in a while).

## Installation

You can install this library with cabal! To do so, type the following commands in a terminal window:

```
git clone https://github.com/mxmxyz/tidal-guiot
cd tidal-guiot
cabal install
```

Then, in tidal (after restarting it in case it was already running), evaluate

```
import Sound.Tidal.Guiot.Control
import Sound.Tidal.Guiot.Functions
```
