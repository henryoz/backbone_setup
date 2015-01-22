'use strict'

class App.Defaults.Model extends Backbone.Model

  initialize: ->
    @init()

  # Overwrite this if initialise functionality required.
  init: ->

  # Identify if a specific value is undefined, and if so set as new value.
  ifUndefined: (attribute, value) ->
    if @get(attribute) is undefined
      @set attribute, value

  formatNumericField: (field) ->
    value = @get field
    if value isnt undefined
      @set field, parseFloat value
