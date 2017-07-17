modalize = ->
  $(document).on 'click', '#modal .modal-footer .btn-primary', (evt) ->
    $form = $('#modal form')

    $form.find('input').each (index, element) ->
      $(element).data 'bs.validator.previous', null
      $(element).data 'bs.validator.errors', null

    $form.validator 'validate'

    hasErrors = $form.data('bs.validator').hasErrors()
    evt.preventDefault() if hasErrors

  $(document).on('hidden.bs.modal', '.modal', ->
    $(this).removeData('bs.modal')
  )

$ ->
  modalize()

$(document).on('page:load', modalize)
