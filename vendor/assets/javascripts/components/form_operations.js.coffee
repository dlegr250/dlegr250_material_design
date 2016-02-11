#======================================================================
# Mark changed input elements as "dirty" for validation checks.
#======================================================================
class @FormOperations
  constructor: () ->
    @setEvents()

  setEvents: () ->
    $(".auto-focus").focus()

    # Mark changed inputs as dirty
    $("input").on "change invalid valid", ->
      $(this).addClass("dirty")
