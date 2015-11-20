module Node.GM.Manipulation
  ( antialias
  , authenticate
  , autoOrient
  , backdrop
  , blur
  , border
  , charcoal
  , clip
  , chop
  , comment
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

-- | Antialias is on by default. Pass false to disable.
foreign import antialias :: forall eff.
                            Boolean
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

-- | Display the image centered on a backdrop
foreign import backdrop :: forall eff. GMObject
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

-- | Annotate an image with a comment
foreign import comment :: forall eff. String -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

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


