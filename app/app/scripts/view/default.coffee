# Default set of functionality for views.
'use strict'

class AllocationTableApp.Defaults.View extends Backbone.View

  initialize: (options) ->
    if @template
      @template = JST["app/scripts/templates/#{@template}.ejs"]
    @subViews = []

  # Check if a given method against a view exists.
  isSet: (method) ->
    return @[method] isnt undefined

  # Renders the view, returning the el.
  # Add extra render processes using a preRender or postRender function.
  # Create templateData to pass custom data to the template, by default passes JSON model data.
  render: ->
    @preRender()
    if @template isnt undefined
      data = @templateData()
      @$el.html @template data
    @el

  chosen: ->
    @$('select').chosen()

  # Creates model JSON data if exists and returns.
  templateData: ->
    if @isSet 'model' then @model.toJSON() else {}

  #Placeholder, no default functionality.
  preRender: ->

  #Creates a sub view entry.
  createSubView: (viewType, element = '', options = {}, replace = true) ->
    view = new viewType options
    if replace is true then method = 'html' else method = 'append'
    if element is ''
      @$el[method] view.render()
    else
      @$(element)[method] view.render()
    @subViews.push view
    view

  createOverlay: (viewType, options = {}) ->
    view = new viewType options
    view.render()

  # Closes the view and subviews, allows further control possible using preClose function.
  close: ->
    @preClose()
    @removeSubViews()
    @removeSpinner()
    @remove()

  preClose: ->

  removeSubViews: ->
    _.each @subViews, (view) =>
      if view isnt null and view isnt undefined
        view.close()
    @subViews = []

  addSpinner: (el = '') ->
    @spinnerView = new AllocationTableApp.Blocks.View.SpinnerView()
    if el is '' then el = @$el else el = @$(el)
    el.html @spinnerView.render()

  removeSpinner: ->
    if @isSet 'spinnerView'
      @spinnerView.close()
