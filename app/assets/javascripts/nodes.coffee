$ ->
  $('.info-button').on 'click', ->
    console.log('click')
    content = $(this).data('content')
    $('#info-container').html(content).show()
