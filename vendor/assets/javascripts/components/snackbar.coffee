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

    # if $("body").data("snackbar").length > 0
    #   App.MD.Snackbar.create($("body").data("snackbar"))
    #
    # if $("body").data("snackbar-error").length > 0
    #   App.MD.Snackbar.create($("body").data("snackbar-error"), { css_class: "snackbar-error" })

  @create: (text, options = {}) ->
    @text = text

    # Set options to override defaults
    @duration = options["duration"] || 5000
    @delay = options["delay"] || 250
    @css_class = options["css_class"] || ""

    if @visible
      # Force hide current one via animation
      @hide()

      # Show new one via animation
      setTimeout (=>
        @show()
      ), @delay
    else
      @visible = true
      @show()

    # Hide new one after normal delay
    @timeout = setTimeout (=>
      @hide()
    ), @duration

  @show: () ->
    @element().html(@text)
    @element().addClass(@css_class).addClass("visible")
    $(".fab").addClass("move-with-snackbar")

  @hide: () ->
    clearTimeout(@timeout)
    @element().removeClass("visible")
    $(".fab").removeClass("move-with-snackbar")

  @element: () ->
    $("#snackbar")
