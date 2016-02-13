#======================================================================
# Assumes BODY tag will have a data-snackbar="text..." attribute.
#======================================================================
class App.MD.SnackbarHandler
  @init: () ->
    snackbarText = $("body").data("snackbar")
    if snackbarText.length > 0
      new Snackbar(snackbarText)
