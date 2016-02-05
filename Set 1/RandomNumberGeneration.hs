module RandomNumberGeneration where
import MCPrelude

fiveRands :: [Integer]
fiveRands
  = let randIter (n, seed) = rand seed
        firstSeed = (rand . mkSeed) 1
    in map fst $ take 5 $ iterate randIter firstSeed

main = do
    print $ product fiveRands