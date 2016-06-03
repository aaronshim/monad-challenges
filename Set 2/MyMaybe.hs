module MyMaybe where
import MCPrelude

data Maybe a = Just a | None

instance Show a => Show (MyMaybe.Maybe a) where
  show (MyMaybe.None) = "None"
  show (MyMaybe.Just a) = show a
