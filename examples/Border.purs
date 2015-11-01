module Main where

import Prelude hiding (append)

import Control.Monad.Eff.Class
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.Console (print)
import Data.Maybe

import Node.GM
import Node.GM.Types
import Node.GM.Color
import Node.GM.Manipulation
import Node.GM.Aff

main = launchAff $ do
  obj      <- liftEff $ gmFile (im) "examples/anonymous.jpg"
  bordered <- liftEff $ border myDimensions obj
  wColor   <- liftEff $ borderColor myColor obj
  e        <- attempt $ write "examples/anonymousChanged.jpg" wColor
  print $ show e
    where
      myDimensions :: Dimensions
      myDimensions = { height: 5, width: 5 }

      myColor :: Color
      myColor = rgb 255 0 0



