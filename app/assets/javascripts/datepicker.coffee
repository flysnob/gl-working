$ ->
  $(document).on 'click', '.calendar-addon', (e) ->
    $(e.target).closest('.addon').find('input').datepicker('show').focus()
