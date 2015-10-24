module Node.GM.Types where

import Prelude

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


