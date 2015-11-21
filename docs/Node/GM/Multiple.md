## Module Node.GM.Multiple

#### `Direction`

``` purescript
data Direction
  = TopToBottom
  | LeftToRight
```

#### `adjoin`

``` purescript
adjoin :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Join images into a single multi-image file.

#### `append`

``` purescript
append :: forall eff. Array FilePath -> Direction -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Appends images to the source image and sets the direction.

#### `average`

``` purescript
average :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Average a set of images

#### `coalesce`

``` purescript
coalesce :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Merge a sequence of images


