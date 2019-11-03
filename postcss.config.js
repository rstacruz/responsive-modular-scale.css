module.exports = {
  plugins: [
    require('postcss-import')(),
    require('postcss-apply')(),
    require('postcss-preset-env')({
      stage: 0,

      // Don't preserve CSS variables
      preserve: false
    })
  ]
}
