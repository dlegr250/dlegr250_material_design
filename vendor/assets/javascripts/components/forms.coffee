#======================================================================
# Mark changed input elements as "dirty" for validation checks.
#======================================================================
class App.MD.Forms
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    # Autosubmit a parent form when a field changes
    # (applied to individual fields)
    $("body").on "change", ":input[data-auto-submit-on-change='true']", (event) =>
      $(event.target).parents("form").submit()

    # Focus cursor
    $(".auto-focus").focus()

    # Mark changed inputs as dirty
    $("body").on "change invalid valid", "input select textarea", (event) =>
      $input = $(event.target)
      $input.addClass("dirty")

      $field = $input.closest(".field-with-validations")

      if $input.is(":invalid")
        $input.addClass("invalid")
        $field.addClass("has-errors")
        $field.find(".error-messages").show() #css("visibility", "visible")
      else
        $input.removeClass("invalid")
        $field.removeClass("has-errors")
        $field.find(".error-messages").hide() #css("visibility", "hidden")

    # Add class to style invalid inputs
    $("select.invalid, input.invalid").closest(".field-with-validations").addClass("has-errors")
