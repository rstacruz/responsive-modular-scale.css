## [v0.3.0.rc1]

> Unreleased

v0.3.0 is an almost-full rewrite. It now supports more PostCSS setups. Use it as CSS modules, functional selectors (`@extend`), or custom property sets (`@apply`).

- **Breaking change:** The filenames have been changed. Since responsive-modular-scale now comes in 3 flavors, you'll need to specify the variant you want. The old default is available as `modularscale.apply.css`.

  ```css
  /* Before (v0.2.0) */
  @import 'responsive-modular-scale.css';

  /* After (v0.3.0) */
  @import 'responsive-modular-scale.css/defaults.css';
  @import 'responsive-modular-scale.css/modularscale.apply.css';
  ```

- **Breaking change:** The classnames have been changed. `--font-size-X` is now `--ms-font-size-X` to prevent potential name clashes.

  ```css
  /* Before (v0.2.0) */
  @apply --font-size-2;

  /* After (v0.3.0) */
  @apply --ms-font-size-2;
  ```

- **New:** Responsive-modular-scale is now available as a CSS module with `modularscale.module.css`. See [README.md](./README.md) for info.

- **New:** Responsive-modular-scale now works as functional selectors (aka, `@extend`) with `modularscale.extend.css`. See [README.md](./README.md) for info.

## [v0.2.0]

> Jan 17, 2019

- Add font sizes 9 to 20. ([@arisacoba], [#2])

[v0.2.0]: https://github.com/rstacruz/responsive-modular-scale.css/compare/v0.1.0...v0.2.0

## [v0.1.0]

> Mar 13, 2017

- Initial release.

[v0.1.0]: https://github.com/rstacruz/responsive-modular-scale.css/tree/v0.1.0
[#2]: https://github.com/rstacruz/responsive-modular-scale.css/issues/2
[@arisacoba]: https://github.com/arisacoba
