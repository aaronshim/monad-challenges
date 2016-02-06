module GeneralizingListsOfGenerators where

import MCPrelude
import RandomCharacterGeneration
import MoreGenerators
import GeneralizingRandomPairs

repRandom :: [Gen a] -> Gen [a]
repRandom [] = \s -> ([], s)
repRandom (x:xs) = generalB (:) x $ repRandom xs

main = do
	print $ fst $ repRandom (replicate 3 randLetter) (mkSeed 1)