#======================================================================
# Add triggers to show/hide elements based on a provided DOM ID.
#======================================================================
class App.MD.Toggles
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    # Toggle to show/hide elements
    $("body").on "click select", "[data-show-element]", (event) =>
      domId = $(event.target).data("show-element")
      $("#{domId}").removeClass("hidden")

    $("body").on "click select", "[data-hide-element]", (event) =>
      domId = $(event.target).data("hide-element")
      $("#{domId}").addClass("hidden")
