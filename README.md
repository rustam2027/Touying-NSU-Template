# Touying MMF NSU

A Mathematics & Mechanics faculty (Novosibirsk State University) themed [Touying](https://github.com/touying-typ/touying) presentation theme for Typst.

Run `typst init @preview/touying-mmf-nsu` to start a new presentation from
this template, or import the theme directly as shown below. An in-depth
example is available [here](example.pdf) ([source](example.typ)).

## Usage

```typst
#import "@preview/touying-mmf-nsu:0.1.0": *

#show: nsu-template.with(
  aspect-ratio: "16-9",
)

#title-slide(
  title: [On The Explosion of Large Death Stars],
  author: [Luke Skywalker, Ph.D.],
  lead: [Master Yoda],
  date: [May 25, 1977],
)

= Introduction

- Bulleted lists
+ and enumerations

use the NSU accent color out of the box.
```

## Enums and Lists

You can use lists and enums as usual.
Enums and lists use the NSU accent color.

## License

This package's code is licensed under MIT, see [LICENSE](LICENSE). The
Mathematics & Mechanics faculty logo in `pictures/logo.svg` is the property of
Novosibirsk State University and is included for use in NSU-affiliated
documents only; it is not covered by the MIT license.
