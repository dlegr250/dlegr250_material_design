#======================================================================
# When changing pages, show a spinner on the main area.
#======================================================================
class Dlegr250MaterialDesign.MainLoader
  constructor: () ->
    @setEvents()

  setEvents: () ->
    $(document).on "page:fetch", ->
      $("#main").html("<div id='main-spinner-container'><div class='spinner'></div></div>")
