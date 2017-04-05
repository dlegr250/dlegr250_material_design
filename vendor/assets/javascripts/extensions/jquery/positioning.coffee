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
