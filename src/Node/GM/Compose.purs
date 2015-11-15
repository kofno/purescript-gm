module Node.GM.Compose
  ( Operator(..)
  , compose
  ) where

import Prelude hiding (compose)
import Control.Monad.Eff
import Node.GM.Types

data Operator = Over
              | In
              | Out
              | Atop
              | Xor
              | Plus
              | Minus
              | Add
              | Subtract
              | Difference
              | Divide
              | Multiply
              | Bumpmap
              | Copy
              | CopyRed
              | CopyGreen
              | CopyBlue
              | CopyOpacity
              | CopyCyan
              | CopyMagenta
              | CopyYellow
              | CopyBlack

instance showComposeOperator :: Show Operator where
  show Over        = "Over"
  show In          = "In"
  show Out         = "Out"
  show Atop        = "Atop"
  show Xor         = "Xor"
  show Plus        = "Plus"
  show Minus       = "Minus"
  show Add         = "Add"
  show Subtract    = "Subtract"
  show Difference  = "Difference"
  show Divide      = "Divide"
  show Multiply    = "Multiply"
  show Bumpmap     = "Bumpmap"
  show Copy        = "Copy"
  show CopyRed     = "CopyRed"
  show CopyGreen   = "CopyGreen"
  show CopyBlue    = "CopyBlue"
  show CopyOpacity = "CopyOpacity"
  show CopyCyan    = "CopyCyan"
  show CopyMagenta = "CopyMagenta"
  show CopyYellow  = "CopyYellow"
  show CopyBlack   = "CopyBlack"

compose :: forall eff. Operator -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
compose o g = composeImpl (show o) g

foreign import composeImpl :: forall eff. String -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
