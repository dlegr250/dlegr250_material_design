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
    $("body").on "click select", "[data-show-element]", (e) ->
      $($(this).attr("data-show-element")).show()

    $(document).on "click", "[data-remove-element]", (e) ->
      $($(this).attr("data-remove-element")).remove()

    $(document).on "click", "[role='remove-element']", (e) ->
      $($(this).attr("data-element")).remove()

    $("body").on "click select", "[data-hide-element]", (e) ->
      $($(this).attr("data-hide-element")).hide()
