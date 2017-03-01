# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('select').append('<option value="-1" style="display:none; text-align:center;" disabled>No doctors could be found matching the search query</option>')

  $('select').mousedown((e) ->
    e.preventDefault()
    select = this
    scroll = select.scrollTop
    e.target.selected = !e.target.selected unless !e.target.selected && $('select :selected').length >= 5
    setTimeout (->
      select.scrollTop = scroll
      return
    ), 0
    $(select).focus()
    return
  ).mousemove (e) ->
    e.preventDefault()
    return

  val = ''
  el = undefined

  $('#search_doctors').keyup (e) ->
    if e.which == 38 || e.which == 40
      return

    $('option').css('display','')
    $('option:disabled').css('display','none')
    val = $('#search_doctors').val().trim()
    if val != ''
      el = $("option:icontains('" + val + "')")
    else
      el = undefined
    find_el()

  find_el = ->
    if el && el.length > 0
      $('option').css('display','none')
      $(el).css('display','')
      $('option:disabled').css('display','none')
    else if el && el.length == 0
      $('option').css('display','none')
      $('option:disabled').css('display','')

  $.expr[':'].icontains = $.expr.createPseudo (text) ->
    return (e) ->
      return $(e).text().toUpperCase().indexOf(text.toUpperCase()) >= 0

$(document).on 'turbolinks:load', ready