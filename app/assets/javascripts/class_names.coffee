# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.obj-rel').on 'change', ->
    answer = $('.obj-rel').val().toUpperCase()
    alert (answer + ' would be correct, given the real-life object relationship you selected.')
