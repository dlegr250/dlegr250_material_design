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

    # Add shadow on dialog appbar when scrolling contents
    $(".dialog-scrollable, .dialog-scrollable-no-actions").on "scroll", (e) ->
      $this = $(this)
      $dialogAppbar = $this.parents(".dialog").find(".dialog-appbar")

      if $this.scrollTop()
        $dialogAppbar.addClass("scroll-shadow")
      else
        $dialogAppbar.removeClass("scroll-shadow")

    false

  @closeDialog: (element) ->
    $element = $(element)
    $element.removeClass("visible")
    window.setTimeout =>
      $element.remove()
    , 500
    false

  # DEPRECATED: convert code to use @closeDialog() method
  @hideDialog: (element) ->
    App.MD.Dialog.closeDialog(element)
