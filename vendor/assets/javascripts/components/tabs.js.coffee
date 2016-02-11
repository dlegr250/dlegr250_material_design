#======================================================================
# Manages setting active class for clicked tab.
# Does NOT handle maintaining active class between page refreshes
# as it has no way of knowing which tab should be active.
#======================================================================
class @Tabs
  constructor: () ->
    @setEvents()

  setEvents: () ->
    $("body").on "click", ".tab", ->
      tab = $(this)
      tabParent = $(this).parent(".tabs")
      tabParent.children(".tab").removeClass("active")
      tab.addClass("active")
