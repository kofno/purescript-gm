module Node.GM.Manipulation
  ( adjoin
  , affine
  , antialias
  , append
  , autoOrient
  , flipImage
  , flopImage
  , resize
  , resizeWidth
  , resizeHeight
  ) where

import Control.Monad.Eff
import Data.Maybe

import Node.GM.Types

-- | Join images into a single multi-image file.
foreign import adjoin :: forall eff.
                         GMObject
                      -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Perform an affine transformation on an image
affine :: forall eff. AffineMatrix
                   -> GMObject
                   -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
affine (AffineMatrix s r Nothing) g  = affineImpl (showTransform s r) g
affine (AffineMatrix s r (Just t)) g = affineImpl (showTranslate s r t) g

foreign import affineImpl :: forall eff. String
                                      -> GMObject
                                      -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Antialias is on by default. Pass false to disable.
foreign import antialias :: forall eff.
                            Boolean
                         -> GMObject
                         -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Appends images to the source image and sets the direction.
append :: forall eff. Array FilePath
                   -> Direction
                   -> GMObject
                   -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
append fs LeftToRight g = appendImpl fs true g
append fs TopToBottom g = appendImpl fs false g

foreign import appendImpl :: forall eff.
                             Array FilePath
                          -> Boolean
                          -> GMObject
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


