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

    if $("body").data("snackbar").length > 0
      App.MD.Snackbar.create($("body").data("snackbar"))

    if $("body").data("snackbar-error").length > 0
      App.MD.Snackbar.create($("body").data("snackbar-error"), { cssClass: "snackbar-error" })

  @create: (text, options = {}) ->
    @text = text

    # Set options to override defaults
    @duration = options["duration"] || 5000
    @animationDuration = options["animationDuration"] || 150
    @delay = options["delay"] || 250
    @cssClass = options["cssClass"] || ""

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
    @parent().addClass("has-animating-snackbar")
    setTimeout (=>
      @element().addClass(@cssClass).addClass("visible")
      $(".fab").addClass("move-with-snackbar")
    ), 50

    setTimeout (=>
      @parent().removeClass("has-animating-snackbar")
    ), @animationDuration

  @hide: () ->
    clearTimeout(@timeout)
    @parent().addClass("has-animating-snackbar")
    @element().removeClass("visible")
    $(".fab").removeClass("move-with-snackbar")

    setTimeout (=>
      @parent().removeClass("has-animating-snackbar")
    ), @animationDuration

  @element: () ->
    $("#snackbar")

  @parent: () ->
    @element().parent()
