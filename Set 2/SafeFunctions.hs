module SafeFunctions where
import MCPrelude
import qualified MyMaybe as M

headMay :: [a] -> M.Maybe a
headMay [] = M.None
headMay (x:xs) = M.Just x

tailMay :: [a] -> M.Maybe [a]
tailMay [] = M.None
tailMay xs = M.Just (tail xs)

--lookupMay :: Eq a => a -> [(a, b)] -> M.Maybe b

divMay :: (Eq a, Fractional a) => a -> a -> M.Maybe a
divMay _ 0 = M.None
divMay x y = M.Just (x / y)

maximumMay :: Ord a => [a] -> M.Maybe a
maximumMay [] = M.None
maximumMay xs = M.Just (maximum xs)

minimumMay :: Ord a => [a] -> M.Maybe a
minimumMay [] = M.None
minimumMay xs = M.Just (minimum xs)
