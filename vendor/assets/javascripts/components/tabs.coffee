#======================================================================
# Manages setting active class for clicked tab.
# Does NOT handle maintaining active class between page refreshes
# as it has no way of knowing which tab should be active.
#======================================================================
class App.MD.Tabs
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    $("body").on "click", ".tab", (event) =>
      tab = $(event.target)
      tabParent = tab.parent(".tabs")
      tabParent.children(".tab").removeClass("active")
      tab.addClass("active")
