module Node.GM.Color
 ( rgba
 , rgb
 , toHex
 , toRGBA
 , bitdepth
 , blackThreshold
 , bluePrimary
 , borderColor
 , box
 , channel
 , colorize
 , colorMap
 , colors
 , contrast
 , Color(RGBA)
 , Channel(..)
 , ColorMap(..)
 ) where

import Prelude
import Node.GM.Types
import Control.Monad.Eff

data Color = RGBA Int Int Int Number

instance showColor :: Show Color where
  show (RGBA r g b a) = "(RGBA " ++ show r ++ " " ++ show g ++ " " ++ show b ++ " " ++ show a ++ ")"

data Channel = Red
             | Green
             | Blue
             | Opacity
             | Matte
             | Cyan
             | Magenta
             | Yellow
             | Black
             | Gray

instance showChannel :: Show Channel where
  show Red     = "Red"
  show Green   = "Green"
  show Blue    = "Blue"
  show Opacity = "Opacity"
  show Matte   = "Matte"
  show Cyan    = "Cyan"
  show Magenta = "Magenta"
  show Yellow  = "Yellow"
  show Black   = "Black"
  show Gray    = "Gray"

data ColorMap = SharedColorMap
              | PrivateColorMap

-- | Changes the black threshold for the image
blackThreshold :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
blackThreshold c gobj = blackThresholdImpl (toHex c) gobj

foreign import blackThresholdImpl :: forall eff. String
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

colorMap :: forall eff. ColorMap -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
colorMap SharedColorMap g  = colorMapImpl "shared" g
colorMap PrivateColorMap g = colorMapImpl "private" g

foreign import colorMapImpl :: forall eff.
                               String
                            -> GMObject
                            -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

foreign import colors :: forall eff.
                         Int
                      -> GMObject
                      -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Colorize image
colorize :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
colorize (RGBA r g b _) gobj = colorizeImpl r g b gobj

foreign import colorizeImpl :: forall eff.
                               Int
                            -> Int
                            -> Int
                            -> GMObject
                            -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Increase contrast
foreign import contrast :: forall eff. Int -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | The number of bits of color preserved in the image.
foreign import bitdepth :: forall eff. Int
                                    -> GMObject
                                    -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | blue chromaticity primary point
bluePrimary :: forall eff. Point -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
bluePrimary p g = bluePrimaryImpl p.x p.y g

foreign import bluePrimaryImpl :: forall eff. Int
                                           -> Int
                                           -> GMObject
                                           -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Utility functions

rgba :: Int -> Int -> Int -> Number -> Color
rgba = RGBA

rgb :: Int -> Int -> Int -> Color
rgb r g b = RGBA r g b 1.0

toHex :: Color -> String
toHex (RGBA r g b a) = "#" ++ toHexI r ++ toHexI g ++ toHexI b

foreign import toHexI :: Int -> String

toRGBA :: Color -> String
toRGBA (RGBA r g b a) = "'rgba(" ++ show r ++ "," ++ show g ++ "," ++ show b ++ "," ++ show a ++ ")'"


