module Node.GM.Aff
  ( toBuffer
  , toBufferFormat
  , write
  )
  where

import Prelude
import Node.GM.Types
import Control.Monad.Aff
import Control.Monad.Eff
import Node.Buffer (Buffer())
import Control.Monad.Eff.Exception(Error())

foreign import toBufferEff :: forall eff.
                            GMObject
                         -> (Buffer -> Eff eff Unit)
                         -> (Error -> Eff eff Unit)
                         -> Eff eff Unit

-- | Write the converted image to a Buffer
toBuffer :: forall eff. GMObject -> Aff eff Buffer
toBuffer gmobj = makeAff (\err success -> toBufferEff gmobj success err)

foreign import toBufferFormatEff :: forall eff.
                                  Format
                               -> GMObject
                               -> (Buffer -> Eff eff Unit)
                               -> (Error  -> Eff eff Unit)
                               -> Eff eff Unit

toBufferFormat :: forall eff. Format -> GMObject -> Aff eff Buffer
toBufferFormat format gmobj =
  makeAff (\err success -> toBufferFormatEff format gmobj success err)


foreign import writeEff :: forall eff a.
                         FilePath
                      -> GMObject
                      -> (a -> Eff eff Unit)
                      -> (Error -> Eff eff Unit)
                      -> Eff eff Unit

-- | Wite new image to disk
write :: forall eff. FilePath
                   -> GMObject
                   -> Aff eff Unit
write gmobj path = makeAff (\err success -> writeEff gmobj path success err)
