#======================================================================
# Mark changed input elements as "dirty" for validation checks.
#======================================================================
class App.MD.Forms
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    $(".auto-focus").focus()

    # Mark changed inputs as dirty
    $("body").on "change invalid valid", "input", (event) =>
      $trigger = $(event.target)
      $trigger.addClass("dirty")
