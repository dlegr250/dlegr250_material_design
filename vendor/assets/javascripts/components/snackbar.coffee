#======================================================================
# Assumes BODY tag will have a data-snackbar="text..." attribute.
#======================================================================
class Dlegr250MaterialDesign.Snackbar
  constructor: () ->
    @setEvents()

  setEvents: () ->
    $(document).on "ready page:load", ->
      snackbarText = $("body").data("snackbar")
      if snackbarText.length > 0
        new Snackbar(snackbarText)
