module Node.GM.Multiple
  ( adjoin
  , append
  , average
  , coalesce
  , Direction(..)
  ) where

import Prelude hiding (append)
import Control.Monad.Eff
import Node.GM.Types

data Direction = TopToBottom | LeftToRight

-- | Join images into a single multi-image file.
foreign import adjoin :: forall eff.
                         GMObject
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

-- | Average a set of images
foreign import average :: forall eff. GMObject
                                   -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

-- | Merge a sequence of images
foreign import coalesce :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

