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

    # Touch interaction require a #main area to trigger the actions.
    if @$main.length > 0
      if @$leftSidebar.length > 0
        @$main.hammer({}).bind("swiperight", ->
          @.showLeftSidebar()
        )

        @$leftSidebar.hammer({}).bind("swipeleft", ->
          @.hideOverlay()
        )

      if @$rightSidebar.length > 0
        @$main.hammer({}).bind("swipeleft", ->
          @.showRightSidebar()
        )

        @$rightSidebar.hammer({}).bind("swiperight", ->
          @.hideOverlay()
        )

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
    App.MD.Dialog.hideDialog()

  @isOverlayVisible: () ->
    @$overlay.hasClass("visible")
