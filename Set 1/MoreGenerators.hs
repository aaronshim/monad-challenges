import MCPrelude

type Gen a = Seed -> (a, Seed)

randEven :: Gen Integer -- the output of rand * 2
randEven s = (2 * r, ns)
	where (r, ns) = rand s
randOdd :: Gen Integer -- the output of rand * 2 + 1
randOdd s = (r + 1, ns)
	where (r, ns) = randEven s
randTen :: Gen Integer -- the output of rand * 10
randTen s = (r * 5, ns)
	where (r, ns) = randEven s

main = do
	let s1 = mkSeed 1
	print $ product $ map fst [randEven s1, randOdd s1, randTen s1]