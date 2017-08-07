$(document).on('change', '.amount input, .round input', () ->
  amt = parseFloat($(this).val())
  amt = 0.00 if isNaN(amt)
  $(this).val(amt.toFixed(2))
)
