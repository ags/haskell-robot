module Robot.Command(Command(..), parseCmd) where

data Command = Move
             | TurnRight
             | TurnLeft
             deriving (Show)

parseCmd :: String -> Maybe Command
parseCmd "MOVE"  = Just Move
parseCmd "LEFT"  = Just TurnLeft
parseCmd "RIGHT" = Just TurnRight
parseCmd _       = Nothing
