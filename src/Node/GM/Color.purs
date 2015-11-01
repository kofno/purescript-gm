module Node.GM.Color
 ( rgba
 , rgb
 , toHex
 , toRGBA
 , Color()
 ) where

import Prelude

data Color = RGBA Int Int Int Number

instance showColor :: Show Color where
  show (RGBA r g b a) = "(RGBA " ++ show r ++ " " ++ show g ++ " " ++ show b ++ " " ++ show a ++ ")"

rgba :: Int -> Int -> Int -> Number -> Color
rgba = RGBA

rgb :: Int -> Int -> Int -> Color
rgb r g b = RGBA r g b 1.0

toHex :: Color -> String
toHex (RGBA r g b a) = "#" ++ toHexI r ++ toHexI g ++ toHexI b

foreign import toHexI :: Int -> String

toRGBA :: Color -> String
toRGBA (RGBA r g b a) = "'rgba(" ++ show r ++ "," ++ show g ++ "," ++ show b ++ "," ++ show a ++ ")'"
