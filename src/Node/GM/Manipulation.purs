module Node.GM.Manipulation
  ( adjoin
  , affine
  , antialias
  , append
  , authenticate
  , autoOrient
  , average
  , backdrop
  , bitdepth
  , blackThreshold
  , bluePrimary
  , blur
  , flipImage
  , flopImage
  , resize
  , resizeWidth
  , resizeHeight
  ) where

import Prelude hiding (append)

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

-- | Decrypt image with a password
foreign import authenticate :: forall eff. String
                                        -> GMObject
                                        -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Sets orientation based on EXIF properties
foreign import autoOrient :: forall eff.
                             GMObject
                          -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Average a set of images
foreign import average :: forall eff. GMObject
                                   -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Display the image centered on a backdrop
foreign import backdrop :: forall eff. GMObject
                                    -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | The number of bits of color preserved in the image.
foreign import bitdepth :: forall eff. Int
                                    -> GMObject
                                    -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Changes the black threshold for the image
blackThreshold :: forall eff. RGBA -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
blackThreshold rgba gobj = blackThresholdImpl (showRGBA rgba) gobj

foreign import blackThresholdImpl :: forall eff. String
                                              -> GMObject
                                              -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | blue chromaticity primary point
bluePrimary :: forall eff. Point -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
bluePrimary p g = bluePrimaryImpl p.x p.y g

foreign import bluePrimaryImpl :: forall eff. Int
                                           -> Int
                                           -> GMObject
                                           -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Blur the image
blur :: forall eff. Blur -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
blur (Blur r s) g = blurImpl r s g

foreign import blurImpl :: forall eff. Number
                                    -> Number
                                    -> GMObject
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


