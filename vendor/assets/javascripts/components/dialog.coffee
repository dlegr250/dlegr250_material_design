#======================================================================
# Manage dialogs (aka modals). Builds upon Layout class.
# Clones original link and removes data-custom-confirm attribute
# and sets the original URL as the action for the "confirm" action
# of the dialog.
#======================================================================
class App.MD.Dialog
  @init: () ->
    @setEvents()

  @setEvents: () ->
    $("body").on "click", "[data-custom-confirm]", (e) =>
      $trigger = $(e.target).closest("[data-custom-confirm]")
      $triggerTemplateId = $trigger.data("custom-confirm")["template"]
      $triggerLinkClone = $trigger.clone().removeAttr("data-custom-confirm")
      $triggerLinkClone.attr("id", "dialog-trigger-original-link")

      $dialog = $($("##{$triggerTemplateId}").html())

      # Copy over original link to dialog
      $dialog.find(".dialog-actions").append($triggerLinkClone.hide())
      @.showDialog($dialog)

    $("body").on "click", "[role='dialog-close']", (e) ->
      $dialog = $(this).parents(".dialog-container")
      App.MD.Dialog.closeDialog($dialog)

    $("body").on "click", "[role='dialog-confirm']", (e) ->
      $dialog = $(this).parents(".dialog-container")
      $dialog.find("#dialog-trigger-original-link").click()
      App.MD.Dialog.closeDialog($dialog)

    $(document).on "click", ".dialog-container", (e) ->
      $target = $(e.target)
      # If explicitely told not to close
      if ($target.attr("data-closable") == "false")
        return false

      # If clicking ONLY on parent element (not inner dialog)
      if $target.hasClass("dialog-container")
        App.MD.Dialog.closeDialog($target)

  @call: (html) ->
    $dialog = $(html)
    @.showDialog($dialog)

  @showDialog: (element) ->
    element = $(element)
    App.MD.Menus.hideMenus()
    $("body").append(element)
    element.hide().show()
    element.addClass("visible")
    element.find("input[autofocus]").focus()

    # Add shadow on scroll
    element.find(".dialog-content, .dialog-scrollable").on "scroll", (e) ->
      $scrollContainer = $(this)
      $header = element.find(".dialog-toolbar")
      if $scrollContainer.scrollTop()
        $header.addClass("scroll-shadow-active")
      else
        $header.removeClass("scroll-shadow-active")

    false

  @closeDialog: (element) ->
    $element = $(element)
    hideButNotDestroy = ($element.attr("data-permanent") == "true")
    $element.removeClass("visible")
    window.setTimeout =>
      if hideButNotDestroy
        # NOOP
      else
        $element.remove()
    , 500
    false

  # DEPRECATED: convert code to use @closeDialog() method
  @hideDialog: (element) ->
    App.MD.Dialog.closeDialog(element)
