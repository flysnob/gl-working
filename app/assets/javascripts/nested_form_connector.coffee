$(window).on 'nested:fieldAdded', ->
  $('.row-container:last select,tr.fields:last select').select2(
    theme: 'bootstrap'
  )
  window.validator.update() if window.validator

window.nestedFormEvents.insertFields = (content, assoc, link) ->
  if $(link).closest('table').size() > 0
    $tr = $(link).closest('tr')
    $(content).insertBefore $tr
  else
    $row = $(link).closest('.row')
    $(content).insertBefore $row
