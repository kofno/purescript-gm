## Module Node.GM.Manipulation

#### `antialias`

``` purescript
antialias :: forall eff. Boolean -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Antialias is on by default. Pass false to disable.

#### `authenticate`

``` purescript
authenticate :: forall eff. String -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Decrypt image with a password

#### `autoOrient`

``` purescript
autoOrient :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Sets orientation based on EXIF properties

#### `backdrop`

``` purescript
backdrop :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Display the image centered on a backdrop

#### `blur`

``` purescript
blur :: forall eff. Blur -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Blur the image

#### `border`

``` purescript
border :: forall eff. Dimensions -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Draw a border around the image

#### `charcoal`

``` purescript
charcoal :: forall eff. Number -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Simoulates an effect like a charcoal drawing. Accepts a factor between 0.0
and 1.0

#### `chop`

``` purescript
chop :: forall eff. Dimensions -> Point -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Removes pixels from the interior of an image

#### `clip`

``` purescript
clip :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Apply clipping path

#### `comment`

``` purescript
comment :: forall eff. String -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Annotate an image with a comment

#### `flipImage`

``` purescript
flipImage :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Flips the image vertically

#### `flopImage`

``` purescript
flopImage :: forall eff. GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Flips the image horizontally

#### `resize`

``` purescript
resize :: forall eff. Dimensions -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Resize the image to a box the size of dimensions, while maintaing
the aspect ratio of the image.

#### `resizeWidth`

``` purescript
resizeWidth :: forall eff. Int -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Change the width but maintain the aspect ratio

#### `resizeHeight`

``` purescript
resizeHeight :: forall eff. Int -> GMObject -> Eff (gm :: GRAPHICS_MAGIC | eff) GMObject
```

Change the height but maintain the aspect ratio


