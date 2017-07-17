establishTabClickHandler = ->
  $('.nav-tabs a').on('click', (e) ->
    e.preventDefault()
    $(this).tab('show')
  )

$ ->
  establishTabClickHandler()

$(document).on('page:load', establishTabClickHandler)
