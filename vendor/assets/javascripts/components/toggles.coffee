#======================================================================
# Add triggers to show/hide elements based on a provided DOM ID.
#======================================================================
class App.MD.Toggles
  @init: () ->
    @setEvents()

  @setEvents: () ->
    # Toggle to show/hide elements
    $(document).on "click select", "[data-show-element]", (e) ->
      $($(this).attr("data-show-element")).removeClass("hidden") #.show()

    $(document).on "click", "[data-remove-element]", (e) ->
      $($(this).attr("data-remove-element")).remove()

    $(document).on "click", "[role='remove-element']", (e) ->
      $($(this).attr("data-element")).remove()

    $(document).on "click select", "[data-hide-element]", (e) ->
      $($(this).attr("data-hide-element")).addClass("hidden") #.hide()

    $(document).on "click", "[data-toggle-element-if-checked]", (e) ->
      domId = $(e.target).data("toggle-element-if-checked")

      if this.checked
        $("#{domId}").removeClass("hidden")
      else
        $("#{domId}").addClass("hidden")
