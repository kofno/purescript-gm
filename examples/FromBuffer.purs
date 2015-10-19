module Main where

import Prelude
import Control.Monad.Eff.Class
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.Console (print)
import Node.FS.Sync (readFile)

import PureGM

main = launchAff $ do
  buf     <- liftEff $ readFile "examples/anonymous.jpg"
  obj     <- liftEff $ gmBuffer im buf "anonymous.jpg"
  orient  <- liftEff $ autoOrient obj
  flipped <- liftEff $ flipImage orient
  flopped <- liftEff $ flopImage flipped
  resized <- liftEff $ resize { height: 300, width: 600 } flopped
  e <- attempt $ write' "examples/anonymousFlipped.jpg" resized
  print $ show e


