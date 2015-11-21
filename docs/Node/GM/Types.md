## Module Node.GM.Types

#### `GM`

``` purescript
data GM :: *
```

TYPES

#### `GMObject`

``` purescript
data GMObject :: *
```

#### `GRAPHICS_MAGIC`

``` purescript
data GRAPHICS_MAGIC :: !
```

#### `FilePath`

``` purescript
type FilePath = String
```

#### `FileName`

``` purescript
type FileName = String
```

#### `Format`

``` purescript
type Format = String
```

Eventually, I want better type constraints on Format.

#### `Dimensions`

``` purescript
type Dimensions = { height :: Int, width :: Int }
```

#### `Scale`

``` purescript
type Scale = { x :: Int, y :: Int }
```

#### `Rotation`

``` purescript
type Rotation = { x :: Int, y :: Int }
```

#### `Translation`

``` purescript
type Translation = { x :: Int, y :: Int }
```

#### `Point`

``` purescript
type Point = { x :: Int, y :: Int }
```

#### `Radius`

``` purescript
type Radius = Number
```

#### `Sigma`

``` purescript
type Sigma = Number
```

#### `Blur`

``` purescript
data Blur
  = Blur Radius Sigma
```


