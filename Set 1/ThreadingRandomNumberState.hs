module ThreadingRandomNumberState where

import MCPrelude
import RandomCharacterGeneration
import MoreGenerators
import GeneralizingRandomPairs

-- (Seed -> (a, Seed)) -> (a -> Seed -> (b, Seed)) -> (Seed -> (b, Seed))
genTwo :: Gen a -> (a -> Gen b) -> Gen b
genTwo g f s = (f r) ns
	where (r, ns) = g s

mkGen :: a -> Gen a
mkGen x s = (x, s)

-- This is not intending the way I expect it to...
main = do
	let randLetter2 = genTwo randLetter mkGen
	let randLetter3 = genTwo randLetter2 mkGen
	let seed = mkSeed 1
	print $ fst $ randLetter seed
	print $ fst $ randLetter2 seed
	print $ fst $ randLetter3 seed