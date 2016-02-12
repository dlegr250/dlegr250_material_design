#======================================================================
# Sets global App module used throughout application.
#======================================================================

window.Dlegr250MaterialDesign ||= {}

$(document).on "ready page:load", ->
  new Dlegr250MaterialDesign.Layout()
  new Dlegr250MaterialDesign.Menus()
  new Dlegr250MaterialDesign.Dialog()
  new Dlegr250MaterialDesign.Tabs()
  new Dlegr250MaterialDesign.Forms()
  new Dlegr250MaterialDesign.SnackbarHandler()
