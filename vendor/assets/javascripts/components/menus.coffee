#======================================================================
# Manage menu components.
#======================================================================
class App.MD.Menus
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    $("body").on "click", "[role='menu-trigger']", (event) =>
      @.hideMenus()
      $trigger = $(event.target)

      # Assume menu comes right after target if not specified
      if $trigger.data("menu-id")
        $menu = $("##{$trigger.data('menu-id')}")
      else
        $menu = $($trigger.next(".menu"))

      @.showMenu($menu)
      false

    $("body").on "click", =>
      @.hideMenus()

  @hideMenus: () ->
    $(".menu").removeClass("visible")

  @showMenu: ($menu) ->
    @.fitMenuInsideVisibleWindow($menu)
    $menu.addClass("visible")

  @fitMenuInsideVisibleWindow: ($menu) ->
    # Calculate what the menu position needs to be
    topOrBottom = ($menu.data("position") || "top-right").split("-")[0]
    leftOrRight = ($menu.data("position") || "top-right").split("-")[1]

    windowBottom = $(window).height()
    windowRight = $(window).width()
    menuBottom = $menu.offset().top + $menu.outerHeight()
    menuRight = $menu.offset().left + $menu.outerWidth()

    if menuBottom > windowBottom
      topOrBottom = "bottom"
    if menuRight > windowRight
      leftOrRight = "right"

    menuPosition = "#{topOrBottom}-#{leftOrRight}"

    # Set the menu position styles to actually show up in visible window
    switch menuPosition
      when "top-right"
        styles = {
          left: "auto",
          right: 0,
          top: 0,
          bottom: "auto",
          "transform-origin": "100% 0"
        }
      when "top-left"
        styles = {
          left: 0,
          right: "auto",
          top: 0,
          bottom: "auto",
          "transform-origin": "0 0"
        }
      when "bottom-left"
        styles = {
          left: 0,
          right: "auto",
          top: "auto",
          bottom: 0,
          "transform-origin": "0 100%"
        }
      when "bottom-right"
        styles = {
          left: "auto",
          right: 0,
          top: "auto",
          bottom: 0,
          "transform-origin": "100% 100%"
        }

    $menu.css(styles)
