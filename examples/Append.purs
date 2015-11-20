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
import Node.GM.Multiple as M
import Node.GM.Aff

main :: Eff ( gm :: GRAPHICS_MAGIC
            , err :: EXCEPTION
            , console :: C.CONSOLE
            ) Unit
main = launchAff $ do
  obj       <- liftEff $ gmFile (im) "examples/anonymous.jpg"
  appended  <- liftEff $ M.append ["examples/the_larch.jpg"] myDirection obj
  e         <- attempt $ write "examples/anonymousChanged.jpg" appended
  print $ show e
    where
      myDirection :: M.Direction
      --myDirection = M.TopToBottom
      myDirection = M.LeftToRight


