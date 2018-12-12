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
    window.location.reload()
  )
    
  $(document).on 'shown.bs.modal', '.modal', (evt) ->
    $form = $('#modal form')
    
    $form.find('textarea').each (index, element) ->
      $(element).wysihtml5(
        { 'toolbar': {
          'font-styles': false,
          'color': false,
          'image': false,
          'link': false
        } }
      )
  
  $(document).on 'change', '#project_subject', (evt) ->
    subject = $('#project_subject').val()
    $.ajax "/subjects/#{subject}/versions",
      datatype: 'json',
      success: (data) ->
        $(data).each (k, v) ->
          date = new Date(v.effective_date)
          dateString = (date.getMonth() + 1) + '/' + date.getDate() + '/' + date.getFullYear()
          radio = "<div class='radio'><input type='radio' name='version' value='#{v.id}'>Ver. #{v.version_number} (effective as of #{dateString})</div>"
          $('#version-radio-container').html(radio)
      error: (jqXHR, textStatus, errorThrown) ->
        false

$ ->
  modalize()

$(document).on('page:load', modalize)
