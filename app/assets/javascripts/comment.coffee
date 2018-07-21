comment = ->
  $('#comment').wysihtml5({
    'toolbar':{
      'font-styles': false,
      'color': false,
      'image': false,
      'link': false,
      'emphasis': {
        'small': false
      },
      'size': 'xs'
    },
    'events': {
      'blur': () ->
        save()
    }
  })

  save = () ->
    $comment = $('textarea#comment').val()
    $node_id = $('#node_id').val()

    $.ajax "/nodes/#{$node_id}/comment",
      method: 'GET',
      data: { id: $node_id, comment: $comment },
      success: (data) ->
        true

$(document).on('turbolinks:load', comment)
