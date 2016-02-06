module ThreadingRandomNumberState where

import MCPrelude
import RandomCharacterGeneration
import MoreGenerators
import GeneralizingRandomPairs

-- (Seed -> (a, Seed)) -> (a -> Seed -> (b, Seed)) -> (Seed -> (b, Seed))
-- so interpret this in a general way where maybe the second input 
--  (the a -> Gen b) is a choice function that will somehow affect the
--  Gen b used on the results of Gen a to combine them into a chained rand
genTwo :: Gen a -> (a -> Gen b) -> Gen b
genTwo g f s = (f r) ns
	where (r, ns) = g s

mkGen :: a -> Gen a
mkGen x s = (x, s)

-- This is not intending the way I expect it to...
main = do
	let randLetter2 = genTwo randLetter (const randLetter)
	let randLetter3 = genTwo randLetter2 (const randLetter)
	let randLetter5 = genTwo randLetter3 (const randLetter2)
	let seed = mkSeed 1
	print $ fst $ randLetter seed
	print $ fst $ randLetter2 seed
	print $ fst $ randLetter3 seed
	print $ fst $ randLetter5 seed