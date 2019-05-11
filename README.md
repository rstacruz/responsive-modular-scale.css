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

`responsive-modular-scale.css` comes in 2 flavors:

- **CSS property sets**, which you can use via `@apply --font-size-2` via [postcss-apply].
- **CSS modules**, which you can use via `composes: fontSize2`.

[postcss-apply]: https://yarnpkg.com/en/package/postcss-apply

See instructions below.

## Usage as CSS module

You can apply modular scale font sizes using CSS modules. For this, it's recommended to use [postcss-preset-env] along with [postcss-import]. (:warning: Experimental!)

1. **Configure it** &mdash; Set up a `variables.css` with your configuration. I recommend placing this wherever you put your common variables (eg, color palettes and font names).

   ```css
   @import "responsive-modular-scale.css/defaults.css";

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

2. **Compose it in** &mdash; In the modules you want to use it, just import the `variables.css`, then use `composes`.

   ```css
   @import "../variables.css";

   .myButton {
     composes: fontSize2 from "responsive-modular-scale.css/modularscale.module.css";
   }
   ```

These CSS classes are available:

- `fontSizeMinus1` (negative 1)
- `fontSize0` (applies the base font size)
- `fontSize1`
- `fontSize2`
- ...
- `fontSize20`

Learn more about the `composes:` property from the [CSS modules documentation](https://github.com/css-modules/css-modules#composition).

## Usage as property set

You can also apply modular scale font sizes using CSS property sets (aka, `@apply`). You will need a few PostCSS plugins. I recommend using [postcss-preset-env][postcss-preset-env] along with [postcss-import] and [postcss-apply].

<details>
<summary><em>View plugins needed</em></summary>

| Dependency                                      | Comes with [postcss-cssnext]? | Comes with [postcss-preset-env]? |
| ----------------------------------------------- | ----------------------------- | -------------------------------- |
| [postcss-import] to import CSS files            | -                             | -                                |
| [postcss-apply] for property sets               | :+1:                          | -                                |
| [postcss-custom-media] for custom media queries | :+1:                          | :+1:                             |
| [postcss-custom-properties] for CSS variables   | :+1:                          | :+1:                             |

</details>

```css
@import "responsive-modular-scale.css";
```

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

It gives you the following custom property sets:

- `@apply --font-size--1` (negative 1)
- `@apply --font-size-0` (applies the base font size)
- `@apply --font-size-1`
- `@apply --font-size-2`
- ...
- `@apply --font-size-20`

## Configuration

It's recommended you include this in a "common" file included in most of your project's files; usually, that's something like `variables.css`. You can change these ratios and breakpoints like so:

```css
/* variables.css */
@import "responsive-modular-scale.css";

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

```css
/* your-other-styles.css */
@import "./variables.css";

body {
  @apply --font-size-0;
}

div {
  @apply --font-size-4;
}
```

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
