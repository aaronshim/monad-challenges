module GeneralizingListsOfGenerators where

import MCPrelude
import RandomCharacterGeneration
import MoreGenerators
import GeneralizingRandomPairs

repRandom :: [Gen a] -> Gen [a]
repRandom [] s = ([], s)
repRandom (x:xs) s = (generalB (:) x $ repRandom xs ) s

main = do
	print $ fst $ repRandom (replicate 3 randLetter) (mkSeed 1)