# responsive-modular-scale.css

> Responsive typography using CSS variables

This implements a basic [Modular Scale](http://www.modularscale.com/) system using CSS variables. Use this with [postcss-cssnext] and [postcss-import].

[postcss-cssnext]: https://www.npmjs.com/package/postcss-cssnext
[postcss-import]: https://www.npmjs.com/package/postcss-import
[postcss-custom-media]: https://yarnpkg.com/en/package/postcss-custom-media
[postcss-custom-properties]: https://yarnpkg.com/en/package/postcss-custom-properties
[postcss-preset-env]: https://github.com/csstools/postcss-preset-env

## Installation

```bash
# using Yarn
yarn add --exact responsive-modular-scale.css

# using npm
npm install --save --save-exact responsive-modular-scale.css
```

## Usage

`responsive-modular-scale.css` can be used in 3 different ways:

### Functional selectors (`postcss-extend-rule`)

See [§ Usage as functional selectors](#usage-as-functional-selectors).

```css
.title {
  @extend %ms-font-size-2;
}
```

### Property sets (`postcss-apply`)

See [§ Usage as property sets](#usage-as-property-sets).

```css
.title {
  @apply --ms-font-size-2;
}
```

### CSS modules

See [§ Usage as a CSS module](#usage-as-a-css-module).

```css
.title {
  composes: msFontSize2 from 'responsive-modular-scale.css/modularscale.module.css';
}
```

## How it works

To use it, use any of the provided `--font-size-#` custom property sets:

```css
div {
  @apply --font-size-4;
}
```

This applies a `font-size: 2.0736rem` declaration for desktops—the default ratio is 1.2, so that's `1rem * 1.2 ^ 4`. For mobiles and tablets, it will use a different ratio (1.15 and 1.17 by default).

<details>
<summary><em>View sample output</em></summary>

```css
div {
  font-size: 1.74901rem;
}

@media (min-width: 481px) {
  div {
    font-size: 1.87389rem;
  }
}

@media (min-width: 769px) {
  div {
    font-size: 2.0736rem;
  }
}
```

</details>

## Configuring settings

Set up a `variables.css` with your configuration. Consider placing this wherever you put your common variables (eg, color palettes and font names). See: [`defaults.css`](./defaults.css).

```css
:root {
  --ms-ratio-sm: 1.15;
  --ms-ratio-md: 1.17;
  --ms-ratio-lg: 1.2;
  --ms-base: 1rem;
  --ms-base-sm: var(--ms-base);
  --ms-base-md: var(--ms-base-sm);
  --ms-base-lg: var(--ms-base-md);
}

@custom-media --ms-viewport-md (width > 480px);
@custom-media --ms-viewport-lg (width > 768px);
```

## Usage as functional selectors

To use this as functional selectors (ie, `@extend`), you'll need these PostCSS plugins:

- [**postcss-prepend-imports**](postcss-prepend-imports)
- [**postcss-extend-rule**](postcss-extend-rule)
- [**postcss-preset-env**](postcss-preset-env)

Configure PostCSS to load these plugins and import your variables. Here's an example config:

```js
/* postcss.config.js */
module.exports = ctx => {
  return {
    plugins: [
      // ...
      require('postcss-prepend-imports')({
        files: [
          require.resolve(
            'responsive-modular-scale.css/responsive-modular-scale.css'
          )
        ]
      }),
      require('postcss-extend-rule')(),
      require('postcss-preset-env')({
        importFrom: [require.resolve('./your/path/to/variables.css')]
      })
      // ...
    ]
  }
}
```

You'll then be able to use them with `@extend` in your CSS.

```css
.title {
  @extend %ms-font-size-2;
}
```

These selectors will become available:

- `@extend %ms-font-size--1` (negative 1)
- `@extend %ms-font-size-0` (applies the base font size)
- `@extend %ms-font-size-1`
- `@extend %ms-font-size-2`
- ...
- `@extend %ms-font-size-20`

## Usage as property sets

You can also apply modular scale font sizes using CSS property sets (aka, `@apply`). You'll need these PostCSS plugins:

- [**postcss-prepend-imports**](postcss-prepend-imports)
- [**postcss-apply**](postcss-apply)
- [**postcss-preset-env**](postcss-preset-env)

Configure PostCSS to load these plugins and import your variables. Here's an example config:

```js
/* postcss.config.js */
module.exports = ctx => {
  return {
    plugins: [
      // ...
      require('postcss-prepend-imports')({
        files: [
          require.resolve(
            'responsive-modular-scale.css/responsive-modular-scale.css'
          )
        ]
      }),
      require('postcss-extend-rule')(),
      require('postcss-preset-env')({
        importFrom: [require.resolve('./your/path/to/variables.css')]
      })
      // ...
    ]
  }
}
```

You'll then be able to use them with `@apply` in your CSS.

```css
.title {
  @apply --ms-font-size-2;
}
```

These property sets will become available:

- `@apply --font-size--1` (negative 1)
- `@apply --font-size-0` (applies the base font size)
- `@apply --font-size-1`
- `@apply --font-size-2`
- ...
- `@apply --font-size-20`

## Usage as a CSS module

:warning: `Experimental` - You can apply modular scale font sizes using CSS modules.

To use this as functional selectors (ie, `@extend`), you'll need these PostCSS plugins:

- [**postcss-preset-env**](postcss-preset-env)

Configure PostCSS to load these plugins and import your variables. Here's an example config:

```js
/* postcss.config.js */
module.exports = ctx => {
  return {
    plugins: [
      // ...
      require('postcss-preset-env')({
        importFrom: [require.resolve('./your/path/to/variables.css')]
      })
      // ...
    ]
  }
}
```

You'll then be able to use them with `composes` in your CSS.

```css
.myButton {
  composes: msFontSize2 from 'responsive-modular-scale.css/modularscale.module.css';
}
```

These CSS classes are available:

- `msFontSizeMinus1` (negative 1)
- `msFontSize0` (applies the base font size)
- `msFontSize1`
- `msFontSize2`
- ...
- `msFontSize20`

Learn more about the `composes:` property from the [CSS modules documentation](https://github.com/css-modules/css-modules#composition).

## Prior art

- [postcss-modular-scale](https://www.npmjs.com/package/postcss-modular-scale) is a PostCSS plugin. However, it doesn't support responsive ratios, and the syntax is non-standard CSS.

- [modularscale-sass](https://www.npmjs.com/package/modularscale-sass) is, in my opinion, the gold standard modular scale implementation. It only supports Sass, however.

## Also see

- [PostCSS](http://postcss.org/) - CSS transformation tool.
- [cssnext](http://cssnext.io/) - use tomorrow's CSS syntax today.
- [cssnext custom properties](http://cssnext.io/features/#custom-properties-set-apply) documentation

## Thanks

**responsive-modular-scale.css** © 2019, Rico Sta. Cruz. Released under the [MIT] License.<br>
Authored and maintained by Rico Sta. Cruz with help from contributors ([list][contributors]).

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[mit]: LICENSE.md
[contributors]: http://github.com/rstacruz/responsive-modular-scale.css/contributors
[css-modules]: https://github.com/css-modules/css-modules
[postcss-apply]: https://yarnpkg.com/en/package/postcss-apply
[postcss-extend-rule]: https://github.com/csstools/postcss-extend-rule
[postcss-prepend-imports]: https://www.npmjs.com/package/postcss-prepend-imports
