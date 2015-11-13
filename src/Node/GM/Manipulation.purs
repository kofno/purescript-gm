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
  , border
  , borderColor
  , box
  , channel
  , charcoal
  , clip
  , coalesce
  , chop
  , colorize
  , colorMap
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
import Node.GM.Color

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
blackThreshold :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
blackThreshold c gobj = blackThresholdImpl (toHex c) gobj

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

-- | Draw a border around the image
border :: forall eff.
          Dimensions
       -> GMObject
       -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
border d g = borderImpl d.width d.height g

foreign import borderImpl :: forall eff.
                             Int
                          -> Int
                          -> GMObject
                          -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Change the color of the border
borderColor :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
borderColor c g = borderColorImpl (toHex c) g

foreign import borderColorImpl :: forall eff.
                                  String
                               -> GMObject
                               -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Sets color of the annotation bounding box
box :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
box c g = boxImpl (toRGBA c) g

foreign import boxImpl :: forall eff.
                          String
                       -> GMObject
                       -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Specifies a channel for other operations
channel :: forall eff.
           Channel
        -> GMObject
        -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
channel c g = channelImpl (show c) g

foreign import channelImpl :: forall eff.
                              String
                           -> GMObject
                           -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Simoulates an effect like a charcoal drawing. Accepts a factor between 0.0
-- | and 1.0
foreign import charcoal :: forall eff. Number
                                    -> GMObject
                                    -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject


-- | Removes pixels from the interior of an image
chop :: forall eff. Dimensions
                 -> Point
                 -> GMObject
                 -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
chop d p g = chopImpl d.width d.height p.x p.y g

foreign import chopImpl :: forall eff.
                           Int
                        -> Int
                        -> Int
                        -> Int
                        -> GMObject
                        -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Apply clipping path
foreign import clip :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Merge a sequence of images
foreign import coalesce :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Colorize image
colorize :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
colorize (RGBA r g b _) gobj = colorizeImpl r g b gobj

foreign import colorizeImpl :: forall eff.
                               Int
                            -> Int
                            -> Int
                            -> GMObject
                            -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

colorMap :: forall eff. ColorMap -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
colorMap SharedColorMap g  = colorMapImpl "shared" g
colorMap PrivateColorMap g = colorMapImpl "private" g

foreign import colorMapImpl :: forall eff.
                               String
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


