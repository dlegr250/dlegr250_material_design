jQuery.extend jQuery.fn,
  increment: ->
    @each ->
      $element = $(this)
      $value = parseInt($element.text())
      if $value != NaN
        $element.text($value + 1)
      $element

  decrement: ->
    @each ->
      $element = $(this)
      $value = parseInt($element.text())
      if $value != NaN
        if $value <= 0
          $element.text(0)
        else
          $element.text($value - 1)
      $element
