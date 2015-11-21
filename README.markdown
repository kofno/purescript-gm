purescript-gm
-------------

Purescript bindings to the node gm (GraphicsMagick) module. I've only partially
ported the bindings.

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

#### module documentation

- [Node.GM](docs/Node/GM.md)
- [Node.GM.Aff](docs/Node/GM/Aff.md)
- [Node.GM.Affine](docs/Node/GM/Affine.md)
- [Node.GM.Color](docs/Node/GM/Color.md)
- [Node.GM.ColorSpace](docs/Node/GM/ColorSpace.md)
- [Node.GM.Compose](docs/Node/GM/Compose.md)
- [Node.GM.Compress](docs/Node/GM/Compress.md)
- [Node.GM.Manipulation](docs/Node/GM/Manipulation.md)
- [Node.GM.Multiple](docs/Node/GM/Multiple.md)
- [Node.GM.Types](docs/Node/GM/Types.md)

