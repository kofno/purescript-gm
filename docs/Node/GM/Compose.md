## Module Node.GM.Compose

#### `Operator`

``` purescript
data Operator
  = Over
  | In
  | Out
  | Atop
  | Xor
  | Plus
  | Minus
  | Add
  | Subtract
  | Difference
  | Divide
  | Multiply
  | Bumpmap
  | Copy
  | CopyRed
  | CopyGreen
  | CopyBlue
  | CopyOpacity
  | CopyCyan
  | CopyMagenta
  | CopyYellow
  | CopyBlack
```

##### Instances
``` purescript
instance showComposeOperator :: Show Operator
```

#### `compose`

``` purescript
compose :: forall eff. Operator -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```


