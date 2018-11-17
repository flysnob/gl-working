$ ->
  console.log('loaded')
  $('.collapse').collapse()

setCollapse = ->
  console.log('here')
  $('.panel-collapse').removeClass('in')
  $('.panel-title').find('a').addClass('collapsed')

$(document).on('page:load', setCollapse)
$(document).on('page:load', (e) ->
  $('.collapse').collapse()
)

