module Main where

import Prelude

import Control.Monad.Eff.Exception
import Control.Monad.Eff.Console as C
import Control.Monad.Eff.Class
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.Console (print)
import Data.Maybe

import Node.GM
import Node.GM.Types
import Node.GM.Affine
import Node.GM.Aff

main :: Eff (gm :: GRAPHICS_MAGIC, err :: EXCEPTION, console :: C.CONSOLE) Unit
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


