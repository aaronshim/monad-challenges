module GeneralizingRandomPairs where

import MCPrelude
import MoreGenerators

randPair :: Gen (Char, Integer)
randPair s = ((toLetter c, n), nns)
    where (c, ns) = rand s
          (n, nns) = rand ns

generalPair :: Gen a -> Gen b -> Gen (a,b)
generalPair g1 g2 s = ((ra, rb), nns)
    where (ra, ns) = g1 s
          (rb, nns) = g2 ns

main = do
    print $ fst $ randPair $ mkSeed 1
    print $ fst $ generalPair (fOnRand toLetter rand) rand $ mkSeed 1