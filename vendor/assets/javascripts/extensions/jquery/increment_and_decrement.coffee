jQuery.extend jQuery.fn,
  increment: (param) ->
    @each ->
      $element = $(this)

      if param
        $element.text(param)
      else
        $value = parseInt($element.text())
        if $value != NaN
          $element.text($value + 1)
      $element

  decrement: (param) ->
    @each ->
      $element = $(this)

      if param
        $element.text(param)
      else
        $value = parseInt($element.text())
        if $value != NaN
          if $value <= 0
            $element.text(0)
          else
            $element.text($value - 1)
      $element
