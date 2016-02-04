import MCPrelude

randLetter :: Seed -> (Char, Seed)
randLetter s = (toLetter rc, rs)
    where (rc, rs) = rand s

randString3 :: String
randString3
  = let firstSeed = (randLetter . mkSeed) 1
        randIter (c, s) = randLetter s
    in map fst $ take 3 $ iterate randIter firstSeed

main = do
    print randString3