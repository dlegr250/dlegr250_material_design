#======================================================================
# Manipulate structural elements with regards to the main layout.
# Sidebars, overlay, and notifications.
#======================================================================
class @Layout
  constructor: (params = {}) ->
    @overlay = $("#overlay")
    @leftSidebar = $("#left-sidebar")
    @leftSidebarToggle = $("[role='left-sidebar-toggle']")
    @rightSidebar = $("#right-sidebar")
    @rightSidebarToggle = $("[role='right-sidebar-toggle']")
    @setEvents()

    if Snackbar != undefined
      @showSnackbars()

  setEvents: () ->
    @leftSidebarToggle.on "click", =>
      if @leftSidebar.hasClass("visible")
        @hideSidebar("left")
      else
        @showSidebar("left")

    $(".sidebar-header").on "click", =>
      @hideSidebar("left")
      @hideSidebar("right")

    @rightSidebarToggle.on "click", =>
      if @rightSidebar.hasClass("visible")
        @hideSidebar("right")
      else
        @showSidebar("right")

    # Only when overlay is clicked, not children
    @overlay.on "click", (event) =>
      if event.target.id == @overlay.attr("id")
        @hideSidebar("left")
        @hideSidebar("right")

  isVisible: () ->
    @overlay.hasClass("visible")

  showOverlay: () ->
    @overlay.addClass("visible")

  hideOverlay: () ->
    @overlay.removeClass("visible")
    Dialogs.hideDialog()

  showSidebar: (side = "left") ->
    if side == "left"
      @leftSidebar.addClass("visible")
    else
      @rightSidebar.addClass("visible")
    @showOverlay()

  hideSidebar: (side = "left") ->
    @hideOverlay()
    if side == "left"
      @leftSidebar.removeClass("visible")
    else
      @rightSidebar.removeClass("visible")

  # For page-refresh actions that set notification text
  showSnackbars: () ->
    if $("body").data("snackbar") && $("body").data("snackbar").length > 0
      new Snackbar($("body").data("snackbar"))

    if $("body").data("snackbar-error") && $("body").data("snackbar-error").length > 0
      new Snackbar($("body").data("snackbar-error"))
