module Node.GM where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Exception (Error())
import Control.Monad.Aff
import Node.Buffer (Buffer())

-- | TYPES

foreign import data GM :: *

foreign import data GMObject :: *

foreign import data GRAPHICS_MAGIC :: !

type FilePath = String
type FileName = String

-- | Eventually, I want better type constraints on Format.
type Format = String

type Dimensions = { height :: Int
                  , width  :: Int
                  }

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

-- | Sets orientation based on EXIF properties
foreign import autoOrient :: forall eff.
                             GMObject
                          -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Flips the image vertically
foreign import flipImage :: forall eff.
                            GMObject
                         -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Flips the image horizontally
foreign import flopImage :: forall eff.
                            GMObject
                         -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Resize the image to a box the size of dimensions, while maintaing
-- | the aspect ratio of the image.
foreign import resize :: forall eff.
                         Dimensions
                      -> GMObject
                      -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Change the width but maintain the aspect ratio
foreign import resizeWidth :: forall eff.
                              Int
                           -> GMObject
                           -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Change the height but maintain the aspect ratio
foreign import resizeHeight :: forall eff.
                               Int
                            -> GMObject
                            -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject


-- | OUTPUT

-- | Write the converted image to a Buffer
foreign import toBuffer :: forall eff.
                           GMObject
                        -> (Buffer -> Eff eff Unit)
                        -> (Error -> Eff eff Unit)
                        -> Eff eff Unit

toBuffer' :: forall eff. GMObject -> Aff eff Buffer
toBuffer' gmobj = makeAff (\err success -> toBuffer gmobj success err)

foreign import toBufferFormat :: forall eff.
                                 Format
                              -> GMObject
                              -> (Buffer -> Eff eff Unit)
                              -> (Error  -> Eff eff Unit)
                              -> Eff eff Unit

toBufferFormat' :: forall eff. Format -> GMObject -> Aff eff Buffer
toBufferFormat' format gmobj =
  makeAff (\err success -> toBufferFormat format gmobj success err)


-- | Write the new image to disk
foreign import write :: forall eff a b.
                        FilePath
                     -> GMObject
                     -> (a -> Eff eff Unit)
                     -> (b -> Eff eff Unit)
                     -> Eff eff Unit

-- | Runs the write side effect in Aff
write' :: forall eff. FilePath
                   -> GMObject
                   -> Aff eff Unit
write' gmobj path = makeAff (\err success -> write gmobj path success err)
