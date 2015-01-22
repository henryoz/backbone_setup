'use strict'

String::capitalise = ->
  @charAt(0).toUpperCase() + @slice 1

String::proper = ->
  words = @split ' '
  fixed = []
  for word in words
    fixed.push word.capitalise()
  fixed.join ' '

String::truncate = (max = 25) ->
  if @length > max
    @substring(0, max) + '...'
  else
    @

Array::inArray = (needle = '') ->
  for entry in @
    if entry is needle
      return true
  false
