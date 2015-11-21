## Module Node.GM.Color

#### `Color`

``` purescript
data Color
  = RGBA Int Int Int Number
```

##### Instances
``` purescript
instance showColor :: Show Color
```

#### `Channel`

``` purescript
data Channel
  = Red
  | Green
  | Blue
  | Opacity
  | Matte
  | Cyan
  | Magenta
  | Yellow
  | Black
  | Gray
```

##### Instances
``` purescript
instance showChannel :: Show Channel
```

#### `ColorMap`

``` purescript
data ColorMap
  = SharedColorMap
  | PrivateColorMap
```

#### `blackThreshold`

``` purescript
blackThreshold :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Changes the black threshold for the image

#### `borderColor`

``` purescript
borderColor :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Change the color of the border

#### `box`

``` purescript
box :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Sets color of the annotation bounding box

#### `channel`

``` purescript
channel :: forall eff. Channel -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Specifies a channel for other operations

#### `colorMap`

``` purescript
colorMap :: forall eff. ColorMap -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

#### `colors`

``` purescript
colors :: forall eff. Int -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

#### `colorize`

``` purescript
colorize :: forall eff. Color -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Colorize image

#### `contrast`

``` purescript
contrast :: forall eff. Int -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Increase contrast

#### `bitdepth`

``` purescript
bitdepth :: forall eff. Int -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

The number of bits of color preserved in the image.

#### `bluePrimary`

``` purescript
bluePrimary :: forall eff. Point -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

blue chromaticity primary point

#### `rgba`

``` purescript
rgba :: Int -> Int -> Int -> Number -> Color
```

Utility functions

#### `rgb`

``` purescript
rgb :: Int -> Int -> Int -> Color
```

#### `toHex`

``` purescript
toHex :: Color -> String
```

#### `toRGBA`

``` purescript
toRGBA :: Color -> String
```


