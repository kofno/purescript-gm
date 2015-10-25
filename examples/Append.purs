module Main where

import Prelude

import Control.Monad.Eff.Class
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.Console (print)
import Data.Maybe

import Node.GM
import Node.GM.Types
import qualified Node.GM.Manipulation as M
import Node.GM.Aff

main = launchAff $ do
  obj       <- liftEff $ gmFile (im) "examples/anonymous.jpg"
  appended  <- liftEff $ M.append ["examples/the_larch.jpg"] myDirection obj
  e         <- attempt $ write "examples/anonymousChanged.jpg" appended
  print $ show e
    where
      myDirection :: Direction
      --myDirection = TopToBottom
      myDirection = LeftToRight


