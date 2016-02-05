module GeneralizingRandomPairs where

import MCPrelude
import MoreGenerators
import RandomCharacterGeneration

randPair :: Gen (Char, Integer)
randPair = generalPair randLetter rand

generalPair :: Gen a -> Gen b -> Gen (a,b)
generalPair = generalB (\x y -> (x, y))

generalB :: (a -> b -> c) -> Gen a -> Gen b -> Gen c
generalB f g1 g2 s = (f ra rb, nns)
    where (ra, ns) = g1 s
          (rb, nns) = g2 ns

main = do
    print $ fst $ randPair $ mkSeed 1
    print $ fst $ generalPair (fOnRand toLetter rand) rand $ mkSeed 1