$(document).ready ->
  transactionIds = []
  $('#batch-btn').on 'click', (event) ->
    event.preventDefault()
    $('#batch-btn')[0].href += transactionIds
    optionParam = $('#selected').text().replace(/\s+/g, '')
    editHref = $('#batch-btn')[0].href
    optionInsert = (editHref.indexOf('=') + 1)
    $('#batch-btn')[0].href = editHref.slice(0, optionInsert) + optionParam + editHref.slice(optionInsert)
  $(document).on 'change', '.customer_trans_check', ->
    transactionIds = $.makeArray($('.customer_trans_check:checked').map(->
      @value
    ))
