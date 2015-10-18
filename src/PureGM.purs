module PureGM where

import Prelude
import Control.Monad.Eff
import Control.Monad.Aff

foreign import data GM :: *

foreign import data GMObject :: *

foreign import data GRAPHICS_MAGIC :: !

type FilePath = String

type Dimensions = { height :: Int
                  , width  :: Int
                  }

foreign import gm :: GM

foreign import im :: GM

foreign import gmTest :: forall e. GM -> Eff e Unit

foreign import gmFile :: forall eff.
                         GM
                      -> FilePath
                      -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

foreign import autoOrient :: forall eff.
                             GMObject
                          -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

foreign import flipImage :: forall eff.
                            GMObject
                         -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

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