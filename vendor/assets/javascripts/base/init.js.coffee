#======================================================================
# Setup and initialize global modules.
#======================================================================

window.App ||= {}
window.App.MD || = {}

$(document).on "ready page:load", ->
  App.MD.Layout.init()
  App.MD.Menus.init()
  App.MD.Dialog.init()
  App.MD.Tabs.init()
  App.MD.Forms.init()
  App.MD.SnackbarHandler.init()

  if $("#overlay").length > 0
    $("#overlay").hammer({}).bind("swipeleft", ->
      App.MD.Layout.hideOverlay()
    )

  if $("#left-sidebar").length > 0
    $("#main").hammer({}).bind("swiperight", ->
      App.MD.Layout.showLeftSidebar()
    )

  if $("#right-sidebar").length > 0
    $("#main").hammer({}).bind("swipeleft", ->
      App.MD.Layout.showRightSidebar()
    )
