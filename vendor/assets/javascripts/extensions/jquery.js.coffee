#======================================================================
# Extensions to jQuery core.
# See: http://stackoverflow.com/a/5638717/667772
# See: http://jsfiddle.net/giobongio/RyFje/1/
#======================================================================

# Center an absolute element horizontally and vertically in window
#----------------------------------------------------------------------

jQuery.extend jQuery.fn,
  absoluteCenter: ->
    @each ->
      element = $(this)
      element.css("left", ($(document).width() - element.width()) / 2)
      element.css("top", ($(document).height() - element.height()) / 2)
      element

  horizontalCenter: ->
    @each ->
      element = $(this)
      element.css("left", ($(document).width() - element.width()) / 2)
      element

  verticalCenter: ->
    @each ->
      element = $(this)
      element.css("top", ($(document).height() - element.height()) / 2)
      element

# Change content of element to be centered spinner
#----------------------------------------------------------------------

jQuery.extend jQuery.fn,
  replaceWithSpinner: (options = {}) ->
    color = options["color"] || "primary"
    size = options["size"] || "normal"

    @each ->
      element = $(this)
      spinner = $("<div class='spinner-container'><div class='spinner spinner-#{color} spinner-#{size}'></div></div>")
      element.html(spinner)
      element

# Increment / decrement integer values
#----------------------------------------------------------------------

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
