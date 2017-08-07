window.formalCurrency = (amount, currency) ->
  currency = '$' if currency == undefined
  sign = if amount < 0 then "-" else ""
  amtStr = parseInt(amount = Math.abs(+amount || 0).toFixed(2)) + ""
  firstComma = if (firstComma = amtStr.length) > 3 then firstComma % 3 else 0
  sign + currency +
    (if firstComma > 0 then amtStr.substr(0, firstComma) + ',' else "") +
    amtStr.substr(firstComma).replace(/(\d{3})(?=\d)/g, "$1" + ',') +
    '.' + Math.abs(amount - amtStr).toFixed(2).slice(2)
