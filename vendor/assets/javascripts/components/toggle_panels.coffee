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
      $container = $(event.target).closest(".toggle-panels-container")
      $panel = $(event.target).closest(".toggle-panel")

      if $panel.attr("data-expanded") == "true"
        $container.find(".toggle-panel").attr("data-expanded", "false")
      else
        $container.find(".toggle-panel").attr("data-expanded", "false")
        $panel.attr("data-expanded", "true")
