module Node.GM.Compress
    ( Compression(..)
    , compress
    ) where

import Prelude
import Control.Monad.Eff
import Node.GM.Types

data Compression = None
                 | BZip
                 | Fax
                 | Group4
                 | JPEG
                 | Lossless
                 | LZW
                 | RLE
                 | Zip
                 | LZMA

instance showCompression :: Show Compression where
  show None     = "None"
  show BZip     = "BZip"
  show Fax      = "Fax"
  show Group4   = "Group4"
  show JPEG     = "JPEG"
  show Lossless = "Lossless"
  show LZW      = "LZW"
  show RLE      = "RLE"
  show Zip      = "Zip"
  show LZMA     = "LZMA"

compress :: forall eff. Compression -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
compress c g = compressImpl (show c) g

foreign import compressImpl :: forall eff. String -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
