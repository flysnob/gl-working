enhanceWithSelect2 = ->
  $('select').select2(
    theme: 'bootstrap',
    minimumResultsForSearch: 5
  )

  $('.select2').width("100%")

$ ->
  enhanceWithSelect2()

$(document).on('shown.bs.modal', '.modal', ->
  setTimeout(enhanceWithSelect2, 50)
)

$(document).on('page:load', enhanceWithSelect2)
