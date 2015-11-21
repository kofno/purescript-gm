## Module Node.GM.Aff

#### `toBuffer`

``` purescript
toBuffer :: forall eff. GMObject -> Aff eff Buffer
```

Write the converted image to a Buffer

#### `toBufferFormat`

``` purescript
toBufferFormat :: forall eff. Format -> GMObject -> Aff eff Buffer
```

#### `write`

``` purescript
write :: forall eff. FilePath -> GMObject -> Aff eff Unit
```

Wite new image to disk


