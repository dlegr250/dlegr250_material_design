#======================================================================
# Setup and initialize global modules.
#======================================================================

window.App ||= {}
window.App.MD ||= {}

$(document).on "turbolinks:load", ->
  # App.MD.Layout.init()
  App.MD.Menus.init()
  App.MD.Dialog.init()
  App.MD.TogglePanels.init()
  App.MD.Tabs.init()
  App.MD.Forms.init()
  App.MD.InputMasks.init()
  App.MD.Toggles.init()
  App.MD.Snackbar.init()
  App.MD.ScrollScope.init()
