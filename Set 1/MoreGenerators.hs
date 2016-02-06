module MoreGenerators where
import MCPrelude

type Gen a = Seed -> (a, Seed)

fOnRand :: (a -> b) -> Gen a -> Gen b
fOnRand f g s = (f . fst . g $ s, snd . g $ s)

randEven :: Gen Integer -- the output of rand * 2
randEven = fOnRand (* 2) rand
randOdd :: Gen Integer -- the output of rand * 2 + 1
randOdd = fOnRand (+ 1) randEven
randTen :: Gen Integer -- the output of rand * 10
randTen = fOnRand (* 5) randEven

main = do
    let s1 = mkSeed 1
    print $ product $ map fst [randEven s1, randOdd s1, randTen s1]