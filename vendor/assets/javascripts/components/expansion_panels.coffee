#======================================================================
# Add triggers to show/hide expansion panels.
#======================================================================
class App.MD.ExpansionPanels
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    $("body").on "click", ".expansion-panel-summary", (event) =>
      $(event.target).closest(".expansion-panel").toggleClass("open")
