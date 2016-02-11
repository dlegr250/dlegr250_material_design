#======================================================================
# Single class to manipulate menus for DOM elements. Using class methods
# instead of objects because dynamic elements always have to initialize
# themselves, whereas class methods can operate on all elements utilizing
# jQueries live "on" method.
#======================================================================
class @Menus
  constructor: () ->
    Menus.setEvents()

  @setEvents: () ->
    $("body").on "click", "[role='menu-trigger']", ->
      Menus.hideMenus()

      # Assume menu comes right after target if not specified
      if $(this).data("menu-id")
        menu = $("##{$(this).data("menu-id")}")
      else
        menu = $($(this).next(".menu"))

      Menus.showMenu(menu)
      false

    $(window).on "click", ->
      Menus.hideMenus()

  @hideMenus: () ->
    $(".menu").removeClass("visible")

  @showMenu: (menu) ->
    Menus.changeMenuPositionToFitInsideVisibleWindow(menu)
    menu.addClass("visible")

  # Force menu position inside the constraints of the visible window
  @changeMenuPositionToFitInsideVisibleWindow: (menu) ->
    # Calculate what the menu position needs to be
    topOrBottom = (menu.data("position") || "top-right").split("-")[0]
    leftOrRight = (menu.data("position") || "top-right").split("-")[1]

    windowBottom = $(window).height()
    windowRight = $(window).width()
    menuBottom = menu.offset().top + menu.outerHeight()
    menuRight = menu.offset().left + menu.outerWidth()

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

    menu.css(styles)
