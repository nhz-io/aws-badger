# Webpack Config

## Imports

    webpack   = require 'webpack'
    path      = require 'path'
    pkg       = require './package.json'


## Constants

    ROOT_PATH = path.resolve __dirname
    SRC_PATH  = path.resolve ROOT_PATH, 'src'
    TEST_PATH = path.resolve ROOT_PATH, 'test'

    LAMBDAS   = badge: 'badge.coffee'

    for key, value of LAMBDAS
      LAMBDAS[key] = LAMBDAS["#{key}.min"] = path.resolve SRC_PATH, value

## Config

    module.exports =
      resolve:
        extensions: [ '', '.coffee', '.litcoffee', '.coffee.md' ]
        alias: src: SRC_PATH, test: TEST_PATH
        entry: LAMBDAS
