# Badge Lambda

## Imports

    template   = require './badge.eco'

## LAMBDA Handler

    exports.handler = (event, context) ->

      context.succeed template {
        name : event.name or 'NAME'
        tag  : event.tag or 'TAG'
      }
