module Robot.Table(Table(..), Position, validPosition) where

type Position = (Int, Int)

data Table = Table Int Int

validPosition :: Table -> Position -> Bool
validPosition (Table w h) (x, y) = x >= 0 && y >= 0 && x < w && y < h
