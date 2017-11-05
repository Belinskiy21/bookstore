# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('i.fa-minus#book_page').click ->
    previousValue = parseInt($('input.quantity-input').val())
    if previousValue == 1
      $('input.quantity-input').val(previousValue)
    else
      newValue = previousValue - 1
      $('input.quantity-input').val(newValue)

  $('i.fa-plus#book_page').click ->
    previousValue = parseInt($('input.quantity-input').val())
    newValue = previousValue + 1
    $('input.quantity-input').val(newValue)
