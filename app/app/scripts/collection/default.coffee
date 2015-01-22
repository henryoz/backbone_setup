'use strict'

class App.Defaults.Collection extends Backbone.Collection
  model: Backbone.Model

  initialize: ->
    @init()

  init: ->
