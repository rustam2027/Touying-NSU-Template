#import "@preview/touying:0.6.3": *

#let slide(title: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  // set page
  let header(self) = {
    set align(top)
    show: components.cell.with(inset: 2em)
    set align(horizon)
    set text(fill: self.colors.primary, size: 1em)
    utils.display-current-heading(level: 1)
    linebreak()
    set text(size: 1.5em)
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)
    }
  }

  let footer(self) = {
    set align(bottom)
    show: pad.with(.4em)
    set text(fill: self.colors.neutral-darkest, size: .8em)
    utils.call-or-display(self, self.store.footer)
    h(1fr)
    context utils.slide-counter.display() + " / " + utils.last-slide-number
  }

  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})

#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(scale(200%, image("pictures/grapher.svg")), dx: 50%, dy: 20%)
    place(image("pictures/logo.svg"), dy: -35%, dx: -15%)
    set align(left + horizon)
    block(
      width: 80%,
      inset: (y: 1em),
      radius: 1em,
      text(
        size: 1.5em,
        weight: "regular",
        fill: self.colors.primary,
        info.title,
      ),
    )
    set text(fill: self.colors.neutral-darkest)
    if info.author != none {
      block([Выполнил: #info.author])
    }
    if info.lead != none {
      block([Научный руководитель: #info.lead])
    }
    if info.date != none {
      block([#info.date])
    }
  }
  show emph: it => text(fill: rgb("#54B686"), weight: "bold")[#it]
  touying-slide(self: self, body)
})


#let nsu-template(
  aspect-ratio: "16-9",
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, font: "Montserrat", weight: "regular")
  set list(marker: text(fill: rgb("#54B686"))[#math.circle.filled], spacing: 0.8em)
  set enum(spacing: 1em, numbering: it => circle(radius: 0.5em, fill: rgb("#54B686"))[#align(center + horizon, text(size: 0.5em, fill: white, weight: "bold")[#it])])

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 4em, bottom: 1.5em, x: 3em),
    ),
    config-common(slide-fn: slide),
    config-colors(
      primary: rgb("#54B686"),
      secondary: rgb("#434242"),
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: black,
      tertiary: rgb("#434242"),
    ),
    config-methods(
      alert: (self: none, it) => text(fill: self.colors.primary, it),
    ),
    config-store(
      title: none,
      footer: footer,
    ),
    ..args,
  )

  body
}
