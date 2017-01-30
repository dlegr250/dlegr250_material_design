#======================================================================
# Stops scrolling in child element from bleeding into parent.
#======================================================================
class App.MD.ScrollScope
  @init: () ->
    @setEvents()

  @setEvents: () ->
    $(document).scrollScope({
      elements: ".menu, [data-scroll-scope]"
    })
