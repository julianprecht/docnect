# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('option').mousedown (e) ->
    e.preventDefault()
    $(this).parent().focus()
    $(this).prop 'selected', if !$(this).prop('selected') && $('select :selected').length < 5 then true else false
    false

$(document).ready(ready)
$(document).on('page:load', ready)