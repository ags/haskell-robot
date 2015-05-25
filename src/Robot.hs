module Robot(Robot(..), Direction(..), simulate, right, left) where

import Robot.Command
import Robot.Table

data Direction = North
               | East
               | South
               | West
               deriving (Eq, Show, Enum, Bounded)

data Robot = Robot Direction Position deriving (Show)

nextPosition :: Direction -> Position -> Position
nextPosition North (x, y) = (x, succ y)
nextPosition East (x, y) = (succ x, y)
nextPosition South (x, y) = (x, pred y)
nextPosition West (x, y) = (pred x, y)

right :: Direction -> Direction
right d
  | d == maxBound = minBound
  | otherwise = succ d

left :: Direction -> Direction
left d
  | d == minBound = maxBound
  | otherwise = pred d

simulate :: Table -> Robot -> Command -> Robot
simulate _ (Robot d p) TurnRight = Robot (right d) p
simulate _ (Robot d p) TurnLeft = Robot (left d) p
simulate t r@(Robot d p) Move
  | validPosition t p' = Robot d p'
  | otherwise = r
  where p' = nextPosition d p
