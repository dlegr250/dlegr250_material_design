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
    $("body").on "keyup change invalid valid", "input, select", (event) =>
      $input = $(event.target)
      $input.addClass("dirty")

      $field = $input.closest(".field-with-validations")

      if $input.is(":invalid")
        $input.addClass("invalid")
        $field.addClass("has-errors")
        $field.children(".error-messages").show() #css("visibility", "visible")
      else
        $input.removeClass("invalid")
        $field.removeClass("has-errors")
        $field.children(".error-messages").hide() #css("visibility", "hidden")

    $("input.invalid").closest(".field-with-validations").addClass("has-errors")
