#======================================================================
# Extensions to jQuery core.
# See: http://stackoverflow.com/a/5638717/667772
# See: http://jsfiddle.net/giobongio/RyFje/1/
#======================================================================

# Center an absolute element horizontally and vertically
#----------------------------------------------------------------------
jQuery.extend jQuery.fn,
  absoluteCenter: ->
    @each ->
      element = $(this)
      element.css("left", ($(document).width() - element.width()) / 2)
      element.css("top", ($(document).height() - element.height()) / 2)
      element
