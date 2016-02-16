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

  # Touch interaction require a #main area to trigger the actions.
  if $("#main").length > 0
    if $("#left-sidebar").length > 0
      $("#main").hammer({}).bind("swiperight", ->
        App.MD.Layout.showLeftSidebar()
      )

      $("#left-sidebar").hammer({}).bind("swipeleft", ->
        App.MD.Layout.hideOverlay()
      )

    if $("#right-sidebar").length > 0
      $("#main").hammer({}).bind("swipeleft", ->
        App.MD.Layout.showRightSidebar()
      )

      $("#right-sidebar").hammer({}).bind("swiperight", ->
        App.MD.Layout.hideOverlay()
      )
