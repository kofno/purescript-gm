## Module Node.GM.Affine

#### `Matrix`

``` purescript
data Matrix
```

#### `affine`

``` purescript
affine :: forall eff. Matrix -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Perform an affine transformation on an image

#### `transformMatrix`

``` purescript
transformMatrix :: Scale -> Rotation -> Matrix
```

#### `translateMatrix`

``` purescript
translateMatrix :: Scale -> Rotation -> Translation -> Matrix
```


