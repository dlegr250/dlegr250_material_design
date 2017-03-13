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
    $("body").on "click select", "[data-show-element]", (e) =>
      # domId = $(event.target).data("show-element")
      # $("#{domId}").removeClass("hidden")
      $($(this).attr("data-show-element")).show()

    $(document).on "click", "[data-remove-element]", (e) ->
      $($(this).attr("data-remove-element")).remove()

    $(document).on "click", "[role='remove-element']", (e) ->
      $this = $(this)
      $elementToRemove = $this.attr("data-element")
      $this.closest($elementToRemove).remove()

    $("body").on "click select", "[data-hide-element]", (e) =>
      # domId = $(e.target).data("hide-element")
      # $("#{domId}").addClass("hidden")
      $($(this).attr("data-hide-element")).hide()
