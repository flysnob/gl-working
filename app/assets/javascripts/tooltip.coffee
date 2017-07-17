toolTipperUpper = ->
  $('[data-toggle="tooltip"]').tooltip()
  $('span[rel="tooltip"]').tooltip()
  $('div[rel="tooltip"]').tooltip()

$ ->
  toolTipperUpper()

$(document).on('page:load', toolTipperUpper)
