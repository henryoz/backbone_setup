'use strict'

class App.Defaults.DefaultOverlay extends App.Defaults.View
  overlayTemplate : JST['app/scripts/templates/overlay.ejs']
  overlayTitle    : ''
  allowClose      : true
  subViews        : []
  overlayWidth    : 600

  initialize: (options) ->
    super options
    @drawOverlay()
    if @allowClose is true
      @$('#wa-close-overlay').on 'click', =>
        @close()

  drawOverlay: ->
    @$el.html @overlayTemplate
      overlayTitle : @overlayTitle
      width        : @overlayWidth
      allowClose   : @allowClose
      halfWidth    : (@overlayWidth + 30) / 2

  render: ->
    @preRender()
    @$('#wa-overlay-content').html @template @templateData()
    jQuery('body').append @el
    @$('#wa-overlay-back').fadeIn 200
    @$('#edit-cancel').on 'click', =>
      @close()

  close: ->
    @preClose()
    @$('#wa-close-overlay').off()
    @$('#edit-cancel').off()
    @$el.fadeOut 200
    setTimeout =>
        @remove()
      , 200
