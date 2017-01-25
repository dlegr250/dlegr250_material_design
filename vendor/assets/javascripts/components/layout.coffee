#======================================================================
# Manage layout elements (sidebars, overlay, notifications).
#======================================================================
class App.MD.Layout
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->
    @$main = $("#main")
    @$overlay = $("#overlay")
    @$leftSidebar = $("#left-sidebar")
    @$rightSidebar = $("#right-sidebar")
    @$sidebars = $(".sidebar")

    # Used for media query device breakpoints
    @$smallWidth = 400
    @$mediumWidth = 750
    @$largeWidth = 1000

  @setEvents: () ->
    $(document).on "page:fetch", =>
      @.hideOverlay()

    $("body").on "click", "[role='left-sidebar-toggle']", =>
      @.showLeftSidebar()

    $("body").on "click", "[role='right-sidebar-toggle']", =>
      @.showRightSidebar()

    $(".sidebar-header").on "click", =>
      @.hideOverlay()

    @$overlay.on "click", (event) =>
      if event.target.id == @$overlay.attr("id")
        @.hideOverlay()

  @showLeftSidebar: () ->
    @.showOverlay()
    @$leftSidebar.addClass("visible")

  @hideLeftSidebar: () ->
    @$leftSidebar.removeClass("visible")

  @showRightSidebar: () ->
    @.showOverlay()
    @$rightSidebar.addClass("visible")

  @hideRightSidebar: () ->
    @$rightSidebar.removeClass("visible")

  @showOverlay: () ->
    @$overlay.addClass("visible")

  @hideOverlay: () ->
    @$sidebars.removeClass("visible")
    @$overlay.removeClass("visible")
    # App.MD.Dialog.hideDialog()

  @isOverlayVisible: () ->
    @$overlay.hasClass("visible")
