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

type Scale = { x :: Int , y :: Int }
type Rotation = { x :: Int , y :: Int }
type Translation = { x :: Int , y :: Int }

data AffineMatrix = AffineMatrix Scale Rotation (Maybe Translation)

transformMatrix :: Scale -> Rotation -> AffineMatrix
transformMatrix scale rot = AffineMatrix scale rot Nothing

translateMatrix :: Scale -> Rotation -> Translation -> AffineMatrix
translateMatrix s r t = AffineMatrix s r (Just t)
