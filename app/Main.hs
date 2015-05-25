module Main where

import Control.Monad (unless)
import Data.Char (toUpper)
import System.IO (isEOF)

import Robot
import Robot.Command
import Robot.Table

repl :: Table -> Robot -> IO ()
repl table robot = do
  maybeCommand <- readCommand
  let newRobot = runCommand table robot maybeCommand
  print newRobot
  eof <- isEOF
  unless eof (repl table newRobot)

readCommand :: IO (Maybe Command)
readCommand = parseCmd . map toUpper <$> getLine

runCommand :: Table -> Robot -> Maybe Command -> Robot
runCommand table robot command = maybe robot (simulate table robot) command

main :: IO ()
main = repl table robot
  where robot = Robot North (0, 0)
        table = Table 5 5
