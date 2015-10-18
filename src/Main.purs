module Main where

import Prelude
import Control.Monad.Eff.Class
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.Console (print)
-- import Control.Monad.Eff.Console (print)

import PureGM

main = launchAff $ do
  obj     <- liftEff $ gmFile (im) "/Users/ryan/Downloads/anonymous.jpg"
  orient  <- liftEff $ autoOrient obj
  flipped <- liftEff $ flipImage orient
  flopped <- liftEff $ flopImage flipped
  resized <- liftEff $ resize { height: 300, width: 600 } flopped
  e <- attempt $ write' "/Users/ryan/Downloads/anonymousFlipped.jpg" resized
  print $ show e


