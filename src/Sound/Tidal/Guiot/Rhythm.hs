module Sound.Tidal.Guiot.Rhythm where

import Sound.Tidal.Context

{-
wip/todo
-- Godfried Toussaint's "hop and jump" algorithm for generating odd rhythms

hopjump :: Int -> Int -> Int -> Pattern Bool
hopjump onsets pulses jump = listToPat $ innerHopjump onsets pulses jump 0 (1:(replicate (pulses - 1) 0))


innerHopjump :: Int -> Int -> Int -> [Bool] -> [Bool]
innerHopjump onsets pulses jump lastAdded list
  | (length $ filter (== True) list) == onsets = list
  | list!!(lastAdded + jump) == 0              = 

-- Godfried Toussaint's "phantom rhythms"
-- every event is moved to halfway between its position and the next event's position
-- (sometimes not quite halfway)
-- as the phantom function is applied repeatedly, the rhythm becomes more and more even

phantom :: Pattern a -> Pattern a
phantom = phantomBy (1/2) (1/2)

phantomBy :: Num a => a -> a -> Pattern b -> Pattern b
phantomBy up down
-}

-- 6 basic afro-cuban rhythms

-- [4-2-4-2-4]
shiko :: Pattern Bool
shiko = "1 0 0 0 1 0 1 0 0 0 1 0 1 0 0 0"

-- [3-3-4-2-4]
son :: Pattern Bool
son = "1 0 0 1 0 0 1 0 0 0 1 0 1 0 0 0"

-- [3-4-3-2-4]
rumba :: Pattern Bool
rumba = "1 0 0 1 0 0 0 1 0 0 1 0 1 0 0 0"

-- [3-3-4-1-5]
soukous :: Pattern Bool
soukous = "1 0 0 1 0 0 1 0 0 0 1 1 0 0 0 0"

-- [3-3-4-4-2]
gahu :: Pattern Bool
gahu = "1 0 0 1 0 0 1 0 0 0 1 0 0 0 1 0"

-- [3-3-4-3-3]
bossaNova :: Pattern Bool
bossaNova = "1 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0"


-- 2 african ternary rhythms (12 pulses)

-- [2-2-3-2-3]
fumefume :: Pattern Bool
fumefume = "1 0 1 0 1 0 0 1 0 1 0 0"

-- [2-2-1-2-2-2-1]
bembe :: Pattern Bool
bembe = "1 0 1 0 1 1 0 1 0 1 0 1"


-- 2 aka pygmies rhythms (24 pulses)

-- [3-3-3-2-3-3-2-3-2]
aka1 :: Pattern Bool
aka1 = "1 0 0 1 0 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0"

-- [3-2-2-2-3-2-2-2-2-2]
aka2 :: Pattern Bool
aka2 = "1 0 0 1 0 1 0 1 0 1 0 1 0 0 1 0 1 0 1 0 1 0 1 0"


-- 5 hourglass/isosceles rhythms

-- [2-1-2]
beijing1 :: Pattern Bool
beijing1 = "1 0 1 1 0"

-- [3-2-3]
beijing2 :: Pattern Bool
beijing2 = "1 0 0 1 0 1 0 0"

-- [4-2-4]
dhenki :: Pattern Bool
dhenki = "1 0 0 0 1 0 1 0 0 0"

-- [6-4-6]
vijaya :: Pattern Bool
vijaya = "1 0!5 1 0 0 0 1 0!5"

-- [9-2-9]
mathyaSamkirna :: Pattern Bool
mathyaSamkirna = "1 0!8 1 0 1 0!8"


-- Olivier Messiaen's favorite indian rhythms
-- (from Technique de mon langage musical)

-- [1-3-2-3-3-2-1-2-3-1-3]
simhavrikidita :: Pattern Bool
simhavrikidita = "1 1 0 0 1 0 1 0 0 1 0 0 1 0 1 1 0 1 0 0 1 1 0 0"

-- [2-3-2-12]
ragavardhana :: Pattern Bool
ragavardhana = "1 0 1 0 0 1 0 1 0!11"
