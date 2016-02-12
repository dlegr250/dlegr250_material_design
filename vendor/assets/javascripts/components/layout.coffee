#======================================================================
# Manipulate structural elements with regards to the main layout.
# Sidebars, overlay, and notifications.
#======================================================================
class Dlegr250MaterialDesign.Layout
  constructor: () ->
    @setEvents()

  setEvents: () ->
    $("body").on "click", "[role='left-sidebar-toggle']", ->
      Dlegr250MaterialDesign.Layout.showLeftSidebar()

    $("body").on "click", "[role='right-sidebar-toggle']", ->
      Dlegr250MaterialDesign.Layout.showRightSidebar()

    $(".sidebar-header").on "click", ->
      Dlegr250MaterialDesign.Layout.hideOverlay()

    $("#overlay").on "click", (event) ->
      if event.target.id == $("#overlay").attr("id")
        Dlegr250MaterialDesign.Layout.hideOverlay()

  @showLeftSidebar: () ->
    Dlegr250MaterialDesign.Layout.showOverlay()
    $("#left-sidebar").addClass("visible")

  @hideLeftSidebar: () ->
    $("#left-sidebar").removeClass("visible")

  @showRightSidebar: () ->
    Dlegr250MaterialDesign.Layout.showOverlay()
    $("#right-sidebar").addClass("visible")

  @hideRightSidebar: () ->
    $("#right-sidebar").removeClass("visible")

  @showOverlay: () ->
    $("#overlay").addClass("visible")

  @hideOverlay: () ->
    $(".sidebar").removeClass("visible")
    $("#overlay").removeClass("visible")
    Dlegr250MaterialDesign.Dialog.hideDialog()

  @isOverlayVisible: () ->
    $("#overlay").hasClass("visible")
