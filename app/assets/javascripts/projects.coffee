$ ->
  $('.node-response').on 'mousedown',  ->
    $('#response_value').val($(this).data('responsevalue'))
    $('#target_node').val($(this).data('targetnode'))
    $('#return_node').val($(this).data('returnnode'))
