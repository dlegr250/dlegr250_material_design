#======================================================================
# Assumes BODY tag will have a data-snackbar="text..." attribute.
#======================================================================
class App.MD.SnackbarHandler
  @init: () ->
    snackbarText = $("body").data("snackbar")
    if snackbarText && snackbarText.length > 0
      new Snackbar(snackbarText)

    snackbarErrorText = $("body").data("snackbar-error")
    if snackbarErrorText && snackbarErrorText.length > 0
      snackbarErrorText = "<span class='color-red'><i class='zmdi zmdi-alert-triangle zmdi-hc-fw'></i> #{snackbarErrorText}</span>"
      new Snackbar(snackbarErrorText)
