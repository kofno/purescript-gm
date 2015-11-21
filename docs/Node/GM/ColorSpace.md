## Module Node.GM.ColorSpace

#### `ColorSpace`

``` purescript
data ColorSpace
  = CineonLog
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
```

##### Instances
``` purescript
instance showColorSpace :: Show ColorSpace
```

#### `colorSpace`

``` purescript
colorSpace :: forall eff. ColorSpace -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```


