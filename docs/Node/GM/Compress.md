## Module Node.GM.Compress

#### `Compression`

``` purescript
data Compression
  = None
  | BZip
  | Fax
  | Group4
  | JPEG
  | Lossless
  | LZW
  | RLE
  | Zip
  | LZMA
```

##### Instances
``` purescript
instance showCompression :: Show Compression
```

#### `compress`

``` purescript
compress :: forall eff. Compression -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```


