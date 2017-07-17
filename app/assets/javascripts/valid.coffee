class @ModalFormValidator
  constructor: (@$modal) ->
    @constructValidator(@$modal)

  constructValidator: ($modal) ->
    $form = $modal.find('form.validate')
    $form.validator
      focus: false
      disable: false
      custom:
        adjustments: @invalidTotal,
        balance: @invalidBalance,
        deposits: @invalidDeposit,
        'apply-cash-amount-changed': @applyCashAmountChanged,
        'apply-cash-negative-unapplied': @applyCashNegativeUnapplied

    $form.validator().on 'submit', (evt) ->
      unless (evt.isDefaultPrevented())
        $submittedForm = $(evt.target)
        if ($form.data('submitting') == true)
          # already submitted
          evt.preventDefault();
        else
          $form.data('submitting', true);

  invalidTotal: ->
    # Check for visible, because when the form loads, it may not be shown when the first validation happens
    $amount = $('#customer_adjustment_transaction_amount:visible')
    if $amount.size() > 0
      lines_total = 0
      transaction_total = parseFloat($amount.val())

      $('.adjustment-line:visible').each ->
        $journalLine = $(this)
        $accessorialOption = $journalLine.find('.accessorial option:selected')

        value = $journalLine.find('.amount input').val()
        if value.indexOf("(") == 0
          lines_total += parseFloat(value.split("(")[1].split(")")[0] * -1)
        else
          lines_total += parseFloat(value)

      return 'Customer adjustment does not balance' if lines_total != transaction_total

  invalidDeposit: ($field) ->
    lines_total = 0
    total = parseFloat($('.line-total').val())

    $('.line:visible').each ->
      $line = $(this)

      value = $line.find('.amount input').val()
      if value.indexOf("(") == 0
        lines_total += parseFloat(value.split("(")[1].split(")")[0] * -1)
      else
        lines_total += parseFloat(value)

    return 'Total does not match lines' if lines_total != total

  invalidBalance: ->
    debit_balance = 0
    credit_balance = 0
    balances = true

    $('.fields .journal-line:visible, .fields .recurring-line:visible').each ->
      $journalLine = $(this)

      debit_balance += parseFloat($journalLine.find('.debit input').val())
      credit_balance += parseFloat($journalLine.find('.credit input').val())

    return 'Journal does not balance' if debit_balance != credit_balance

  applyCashAmountChanged: ($element) ->
    $owed = $element.closest('.row-container').find('.owed')

    apply = parseFloat($element.val())
    owed = parseFloat($owed.text().replace(/[^0-9\.-]+/g,""))
    owed = 0-owed if $owed.text().indexOf('(') > 0;

    if (owed > 0 && ((apply > owed) || (apply < 0))) ||
       (owed <= 0 && ((apply < owed) || (apply > 0)))
      return 'Applied cannot be greater than amount owed'

  applyCashNegativeUnapplied: ($element) ->
    shouldFail = false
    $('.modal-body .unallocated input').each((idx, unallocated) ->
      shouldFail = true if parseFloat($(unallocated).val().replace(/[^0-9\.-]+/g,"")) < 0
    )

    return 'Unapplied cannot be negative' if shouldFail

  update: ->
    @$modal.find('form.validate').validator('update')

$(window).on 'loaded.bs.modal', (evt) ->
  window.validator = new ModalFormValidator($(evt.target))
