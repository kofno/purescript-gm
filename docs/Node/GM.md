## Module Node.GM

#### `gm`

``` purescript
gm :: GM
```

CLI INTERFACES
Interface to GraphicsMagick

#### `im`

``` purescript
im :: GM
```

Interface to ImageMagick

#### `gmFile`

``` purescript
gmFile :: forall eff. GM -> FilePath -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

INPUT
Creates a GMOject from a file

#### `gmBuffer`

``` purescript
gmBuffer :: forall eff. GM -> Buffer -> FileName -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Creates a GMObject from a Buffer


