module Node.GM.Color
 ( rgba
 , rgb
 , toHex
 , toRGBA
 , blackThreshold
 , borderColor
 , box
 , colorize
 , Color(RGBA)
 ) where

import Prelude
import Node.GM.Types
import Control.Monad.Eff

data Color = RGBA Int Int Int Number

instance showColor :: Show Color where
  show (RGBA r g b a) = "(RGBA " ++ show r ++ " " ++ show g ++ " " ++ show b ++ " " ++ show a ++ ")"

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

-- | Colorize image
colorize :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
colorize (RGBA r g b _) gobj = colorizeImpl r g b gobj

foreign import colorizeImpl :: forall eff.
                               Int
                            -> Int
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


