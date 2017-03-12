# modularscale.css

> Responsive typography using CSS variables

This implements a basic [Modular Scale](http://www.modularscale.com/) system using CSS variables. Use this with [postcss-cssnext].

[postcss-cssnext]: https://www.npmjs.com/package/postcss-cssnext
[postcss-import]: https://www.npmjs.com/package/postcss-import

## Installation

```css
# using Yarn
yarn add --exact github:rstacruz/modularscale.css

# using npm
npm install --save --save-exact github:rstacruz/modularscale.css

```

## Usage

Simply import it, assuming you're using [postcss-import] and [postcss-cssnext].

```css
@import 'modularscale.css';
```

To use it, use any of the provided `--font-size-#` declarations:

```css
div {
  @apply --font-size-4;
}
```

This applies a `font-size: 2.0736rem` declaration for desktops—the default ratio is 1.2, so that's `1rem * 1.2 ^ 4`.

For mobiles and tablets, it will use a different ratio (1.15 and 1.17 by default).

```css
div { font-size: 1.74901rem; }

@media (min-width: 481px) {
  div { font-size: 1.87389rem; }
}

@media (min-width: 769px) {
  div { font-size: 2.0736rem; }
}
```

## Configuration

It's recommended you include this in a "common" file included in most of your project's files; usually, that's something like `variables.css`. You can change these ratios and breakpoints like so:

```css
/* variables.css */
@import 'modularscale.css';

:root {
  --ms-ratio-sm: 1.15;
  --ms-ratio-md: 1.17;
  --ms-ratio-lg: 1.2;
}

@custom-media --ms-viewport-md (width > 480px);
@custom-media --ms-viewport-lg (width > 768px);
```

```css
/* your-other-styles.css */
@import './variables.css';

div {
  @apply --font-size-4;
}
```

## Thanks

**modularscale.css** © 2017+, Rico Sta. Cruz. Released under the [MIT] License.<br>
Authored and maintained by Rico Sta. Cruz with help from contributors ([list][contributors]).

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[MIT]: http://mit-license.org/
[contributors]: http://github.com/rstacruz/modularscale.css/contributors
