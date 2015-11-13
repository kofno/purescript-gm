module Node.GM.Types where

import Prelude

import Data.Maybe

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

type Scale       = { x :: Int, y :: Int }
type Rotation    = { x :: Int, y :: Int }
type Translation = { x :: Int, y :: Int }
type Point       = { x :: Int, y :: Int }

data AffineMatrix = AffineMatrix Scale Rotation (Maybe Translation)

transformMatrix :: Scale -> Rotation -> AffineMatrix
transformMatrix scale rot = AffineMatrix scale rot Nothing

translateMatrix :: Scale -> Rotation -> Translation -> AffineMatrix
translateMatrix s r t = AffineMatrix s r (Just t)

showTransform :: Scale -> Rotation -> String
showTransform s r = show s.x ++ "," ++ show r.x ++ "," ++ show r.y ++ "," ++ show s.y

showTranslate :: Scale -> Rotation -> Translation -> String
showTranslate s r t = (showTransform s r) ++ "," ++ show t.x ++ "," ++ show t.y


data Direction = TopToBottom | LeftToRight

type Radius = Number
type Sigma  = Number
data Blur   = Blur Radius Sigma

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

