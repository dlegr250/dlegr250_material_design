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
    $("body").on "click", "a[data-custom-confirm]", (e) =>
      $trigger = $(e.target).closest("a[data-custom-confirm]")
      $triggerTemplateId = $trigger.data("custom-confirm")["template"]
      $triggerLinkClone = $trigger.clone().removeAttr("data-custom-confirm")
      $triggerLinkClone.attr("id", "dialog-trigger-original-link")

      $dialog = $($("##{$triggerTemplateId}").html())

      # Copy over original link to dialog
      $dialog.find(".dialog-actions").append($triggerLinkClone.hide())
      @.showDialog($dialog)

    $("body").on "click", "[role='dialog-close']", (e) ->
      $dialog = $(this).parents(".dialog-container")
      App.MD.Dialog.hideDialog($dialog)

    $("body").on "click", "[role='dialog-confirm']", (e) ->
      $dialog = $(this).parents(".dialog-container")
      $dialog.find("#dialog-trigger-original-link").click()
      App.MD.Dialog.hideDialog($dialog)

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
    false

  @hideDialog: (element) ->
    element.removeClass("visible")
    window.setTimeout =>
      element.remove()
    , 500
    false


# class App.MD.Dialog
#   @init: () ->
#     @setVariables()
#     @setEvents()
#
#   @setVariables: () ->
#     @$dialog = $("#dialog")
#
#   @setEvents: () ->
#     $("body").on "click", "a[data-custom-confirm]", (event) =>
#       $trigger = $(event.target).closest("a[data-custom-confirm]")
#       $triggerTemplateId = $trigger.data("custom-confirm")["template"]
#       $triggerLinkClone = $trigger.clone().removeAttr("data-custom-confirm")
#       $triggerLinkClone.attr("id", "dialog-trigger-original-link")
#
#       # Replace dialog content with trigger template
#       $templateHtml = $("##{$triggerTemplateId}").html()
#       @$dialog.html($templateHtml)
#
#       # Copy over original link to dialog
#       @$dialog.find(".dialog-actions").append($triggerLinkClone.hide())
#
#       @.showDialog()
#       false
#
#     @$dialog.on "click", "[role='cancel']", =>
#       @.hideDialog()
#       false
#
#     @$dialog.on "click", "[role='confirm']", =>
#       @$dialog.find("#dialog-trigger-original-link").click()
#       @.hideDialog()
#
#   @call: (html_content) ->
#     @$dialog.html(html_content)
#     @.showDialog()
#
#   @isVisible: () ->
#     @$dialog.hasClass("visible")
#
#   @showDialog: () ->
#     App.MD.Layout.showOverlay()
#     App.MD.Menus.hideMenus()
#     @$dialog.addClass("visible")
#
#   @hideDialog: () ->
#     @$dialog.removeClass("visible")
#     if App.MD.Layout.isOverlayVisible()
#       App.MD.Layout.hideOverlay()
