module Main where

import Prelude

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
  transform <- liftEff $ affine myMatrix obj
  e         <- attempt $ write "examples/anonymousChanged.jpg" transform
  print $ show e
    where
      -- myMatrix = transformMatrix scale rotate
      myMatrix = translateMatrix scale rotate translate
      scale = { x: 2, y: 2 }
      rotate = { x: 30, y: 0 }
      translate = { x: 2, y: 2 }


