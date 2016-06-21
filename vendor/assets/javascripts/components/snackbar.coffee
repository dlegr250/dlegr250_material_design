#======================================================================
# Implements Google Material Design Snackbar in-app notification.
#======================================================================
class App.MD.Snackbar
  @visible: false

  @init: () ->
    @setEvents()

  @setEvents: () ->
    $("body").on "click", "#snackbar", =>
      @hide()

  @create: (text, options = {}) ->
    @text = text

    # Set options to override defaults
    @duration = options["duration"] || 5000

    if @visible
      # Force hide current one via animation
      @hide()

      # Show new one via animation
      setTimeout (=>
        @show()
      ), 250
    else
      @visible = true
      @show()

    # Hide new one after normal delay
    @timeout = setTimeout (=>
      @hide()
    ), @duration

  @show: () ->
    @element().html(@text)
    # @element().css("display", "block")
    @element().addClass("visible")
    $(".fab").addClass("move-with-snackbar")

  @hide: () ->
    clearTimeout(@timeout)
    @element().removeClass("visible")
    # @element().css("display", "none")
    $(".fab").removeClass("move-with-snackbar")

  @element: () ->
    $("#snackbar")
