module Sound.Tidal.Guiot.Functions where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords
import Sound.Tidal.Utils

import Sound.Tidal.Guiot.Utils

--wrap, courtesy of @yaxu
wrap s e p = (p |% (e - s)) |+ s


-- | aliases for pattern rotation
rotl n p = (n <~) $ p
rotr n p = (n ~>) $ p
shiftl = rotl
shiftr = rotr

-- | shifted rand
shrand n = (shiftl (32.1 * n) $ rand)

-- | shorthands for degradeBy
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

-- | transposing a pattern up and down
transup n p = (|+ note n) $ p
transdown n p = (|- note n) $ p
jtransup n p = (|* note n) $ p
jtransdown n p = (|* note (1/n)) $ p

-- | limiter to prevent filters from going over Nyquist
safety p = (min 22000) <$> p

-- | palindrome of a list, with an added element in the middle
paliWith :: a -> [a] -> [a]
paliWith n l = l ++ [n] ++ reverse l

-- | takes a list of integers and creates a boolean pattern with 1s at the steps whose number is contained in the list
makeStruct :: Foldable t => Int -> t Int -> Pattern Bool
makeStruct steps = fromList . indexElem steps

-- | creates copies transposed to a different pitch
superLayer :: Pattern Double -> Pattern Int -> Pattern ControlMap -> Pattern ControlMap 
superLayer d n = (|* amp (1 / (fmap fromIntegral $ n))) . (stutWith n 0 (|+ note d))

jsuperLayer :: Pattern Double -> Pattern Int -> Pattern ControlMap -> Pattern ControlMap 
jsuperLayer d n = (|* amp (1 / (fmap fromIntegral $ n))) . (stutWith n 0 (|* note d))

-- | the thue-morse word up to n iterations
thuemorse :: Int -> [Bool]
thuemorse n = (iterate thue [True])!!n
    where thue l = l ++ (map not l)

-- | the thue-morse pattern up to n iterations
thuemorsepat :: Int -> Pattern Bool
thuemorsepat n = fromList $ thuemorse n

-- | the tribonacci word up to n iterations
tribonacci :: Int -> [Int]
tribonacci n = (iterate (trib =<<) [0])!!n
    where trib n
	    | n == 0 = [0,1]
            | n == 1 = [0,2]
	    | otherwise = [0]

-- | the tribonacci pattern up to n iterations
tribonaccipat :: Int -> Pattern Int
tribonaccipat n = fromList $ tribonacci n
