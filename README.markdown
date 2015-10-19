purescript-gm
-------------

Purescript bindings to the node gm (GraphicsMagick) module.

#### getting started

You can play with the library examples.

You'll need GraphicsMagick or ImageMagick. The examples use ImageMagick. You
can install these on OS X using brew.

```
$> brew update
$> brew install imagemagick
$> brew install graphicsmagick
```

Then install purescript-gm.

```
$> git clone https://github.com/kofno/purescript-gm
$> npm install
$> pulp dep install
$> pulp build
```

You can build and run one of the examples.

```
$> pulp build examples/ToBuffer.purs
$> pulp run
```



#### TODO

- Complete image manipulators impl
- Start image getter impls
- Improve type coverage (Format, for example)
- Complete compatibiiliy \o/
