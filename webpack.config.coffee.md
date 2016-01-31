# Webpack Config

## Imports

    webpack   = require 'webpack'
    path      = require 'path'
    pkg       = require './package.json'


## Constants

    ROOT_PATH         = path.resolve __dirname
    SRC_PATH          = path.resolve ROOT_PATH, 'src'
    DIST_PATH         = path.resolve ROOT_PATH, 'dist'
    TEST_PATH         = path.resolve ROOT_PATH, 'test'
    NODE_MODULES_PATH = path.resolve ROOT_PATH, 'node_modules'

    LAMBDAS           = badge: 'badge.litcoffee'

    for key, value of LAMBDAS
      LAMBDAS[key] = LAMBDAS["#{key}.min"] = path.resolve SRC_PATH, value

## Config

    module.exports = conf =

### Resolve ###

      resolve:
        extensions    : [ '', '.coffee', '.litcoffee', '.coffee.md' ]
        alias         :
          src: SRC_PATH,
          test: TEST_PATH

### Entry ###

      entry           : LAMBDAS

### Output ###

      output:
        path          : DIST_PATH
        filename      : '[name].js'
        libraryTarget : 'commonjs2'
        library       : true


### Preloaders ###

      module:
        preloaders: [
          {
            test    : /\.(coffee|litcoffee|coffee.md)$/
            loader  : 'coffeelint-loader'
            include : [ SRC_PATH ]
            exclude : [ NODE_MODULES_PATH ]
          }
        ]

### Loaders ###

        loaders: [
          {
            test    : /\.eco$/
            loader  : 'eco'
          }
          {
            test    : /\.(coffee|litcoffee|coffee.md)$/
            loader  : 'coffee-loader'
            include : [ SRC_PATH ]
            exclude : [ NODE_MODULES_PATH ]
          }
        ]

### Plugins ###

        plugins: [
          new webpack.optimize.DedupePlugin()
          new webpack.optimize.UglifyJsPlugin {
            minimize: true,
            include: /\.min\.js$/,
            mangle: except: [ '$super', '$', 'exports', 'require' ]
          }
        ]
