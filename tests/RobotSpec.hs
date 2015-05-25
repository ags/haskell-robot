module RobotSpec where

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck.Arbitrary
import Test.QuickCheck.Gen

import Robot

instance Arbitrary Direction where
  arbitrary = elements [(minBound :: Direction)..]

spec :: Spec
spec = do
  describe "right" $ do
    prop "is the same direction after four rotations" $ do
      let rotate = right . right . right . right
      \d -> rotate d == (d :: Direction)

  describe "left" $ do
    prop "is the same direction after four rotations" $ do
      let rotate = left . left . left . left
      \d -> rotate d == (d :: Direction)
