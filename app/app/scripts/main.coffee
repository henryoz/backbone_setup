'use strict'

window.App =
  Defaults   : {}
  Entities   : {}
  StaticData : {}
  Views      : {}
  Blocks     :
    Model      : {}
    Collection : {}
    View       : {}

  throwError: (message = 'An error ocurred. If this persists, please contact your site administrator.') ->
    alert message

  # Let's get this party started.
  init: ->


jQuery ->
  App.init();
