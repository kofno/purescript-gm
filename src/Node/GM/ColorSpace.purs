module Node.GM.ColorSpace
  ( ColorSpace(..)
  , colorSpace
  ) where

import Prelude
import Node.GM.Types
import Control.Monad.Eff

data ColorSpace = CineonLog
                | CMYK
                | GRAY
                | HSL
                | HWB
                | OHTA
                | RGB
                | Rec601Luma
                | Rec709Luma
                | Rec601YCbCr
                | Rec709YCbCr
                | Transparent
                | XYZ
                | YCbCr
                | YIQ
                | YPbPr
                | YUV

instance showColorSpace :: Show ColorSpace where
  show CineonLog   = "CineonLog"
  show CMYK        = "CMYK"
  show GRAY        = "GRAY"
  show HSL         = "HSL"
  show HWB         = "HWB"
  show OHTA        = "OHTA"
  show RGB         = "RGB"
  show Rec601Luma  = "Rec601Luma"
  show Rec709Luma  = "Rec709Luma"
  show Rec601YCbCr = "Rec601YCbCr"
  show Rec709YCbCr = "Rec709YCbCr"
  show Transparent = "Transparent"
  show XYZ         = "XYZ"
  show YCbCr       = "YCbCr"
  show YIQ         = "YIQ"
  show YPbPr       = "YPbPr"
  show YUV         = "YUV"

colorSpace :: forall eff. ColorSpace -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
colorSpace c g = colorSpaceImpl (show c) g

foreign import colorSpaceImpl :: forall eff. String -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

