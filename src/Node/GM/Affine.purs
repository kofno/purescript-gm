module Node.GM.Affine
  ( Matrix()
  , affine
  , transformMatrix
  , translateMatrix
  ) where

import Prelude
import Control.Monad.Eff
import Data.Maybe
import Node.GM.Types

data Matrix = Matrix Scale Rotation (Maybe Translation)

-- | Perform an affine transformation on an image
affine :: forall eff. Matrix
                   -> GMObject
                   -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
affine (Matrix s r Nothing) g  = affineImpl (showTransform s r) g
affine (Matrix s r (Just t)) g = affineImpl (showTranslate s r t) g

foreign import affineImpl :: forall eff. String -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject

transformMatrix :: Scale -> Rotation -> Matrix
transformMatrix scale rot = Matrix scale rot Nothing

translateMatrix :: Scale -> Rotation -> Translation -> Matrix
translateMatrix s r t = Matrix s r (Just t)

showTransform :: Scale -> Rotation -> String
showTransform s r = show s.x ++ "," ++ show r.x ++ "," ++ show r.y ++ "," ++ show s.y

showTranslate :: Scale -> Rotation -> Translation -> String
showTranslate s r t = (showTransform s r) ++ "," ++ show t.x ++ "," ++ show t.y


