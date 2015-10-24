module Node.GM where

import Prelude
import Control.Monad.Eff
import Node.Buffer (Buffer())

import Node.GM.Types

-- | CLI INTERFACES

-- | Interface to GraphicsMagick
foreign import gm :: GM

-- | Interface to ImageMagick
foreign import im :: GM


-- | INPUT

-- | Creates a GMOject from a file
foreign import gmFile :: forall eff.
                         GM
                      -> FilePath
                      -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Creates a GMObject from a Buffer
foreign import gmBuffer :: forall eff.
                           GM
                        -> Buffer
                        -> FileName
                        -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject



