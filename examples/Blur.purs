module Main where

import Prelude hiding (append)

import Control.Monad.Eff.Class
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.Console (print)
import Data.Maybe

import Node.GM
import Node.GM.Types
import Node.GM.Manipulation
import Node.GM.Aff

main = launchAff $ do
  obj       <- liftEff $ gmFile (im) "examples/anonymous.jpg"
  blurred   <- liftEff $ blur myBlur obj
  e         <- attempt $ write "examples/anonymousChanged.jpg" blurred
  print $ show e
    where
      myBlur :: Blur
      myBlur = Blur 100.0 50.0


