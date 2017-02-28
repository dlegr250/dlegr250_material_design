#======================================================================
# Add triggers to show/hide toggle panels.
#======================================================================
class App.MD.TogglePanels
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    $("body").on "click", ".toggle-panel-summary", (event) =>
      # $(event.target).closest(".toggle-panel").toggleClass("open")
      $panel = $(event.target).closest(".toggle-panel")
      if $panel.attr("data-expanded") == "true"
        $panel.attr("data-expanded", "false")
      else
        $panel.attr("data-expanded", "true")
