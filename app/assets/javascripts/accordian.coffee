# This JS will receive the click event on collapsed or expanded, and toggle the class, and it will swap the glyphicon up for down

# Because this is a jQuery 'on' method, we have to avoid setting up the handler on page:load as well.
$ ->
  $(document).on 'click', '.accordion-container', (evt) ->
    $evtTarget = $(evt.target)
    $target = $(evt.target).closest('.accordion-container')
    $closestLink = $evtTarget.closest('a')
    if $closestLink.length == 0 || !$.contains($target[0], $closestLink[0])
      $intendedTarget = $("##{$target.attr('aria-controls')}")
      if $intendedTarget.hasClass('in')
        $intendedTarget.removeClass('in')
        $target.addClass('collapsed').removeClass('expanded')
        $target.find('.glyphicon-chevron-up').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
      else
        $intendedTarget.addClass('in')
        $target.addClass('expanded').removeClass('collapsed')
        $target.find('.glyphicon-chevron-down').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')
