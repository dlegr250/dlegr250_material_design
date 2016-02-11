#======================================================================
# Manage dialogs (aka modals). Builds upon Layout class.
#======================================================================
class @Dialogs
  constructor: () ->
    Dialogs.setEvents()

  @setEvents: () ->
    $("body").on "click", "a[data-custom-confirm]", ->
      triggerLinkClone = $(this).clone().removeAttr("data-custom-confirm")
      triggerLinkClone.attr("id", "dialog-trigger-original-link")
      templateHtml = $("##{$(this).data('custom-confirm')['template']}").html()
      $("#dialog").html(templateHtml)
      $("#dialog .dialog-actions").append(triggerLinkClone.hide())
      Dialogs.showDialog()
      false

    $("body").on "click", "#dialog [role='cancel']", ->
      Dialogs.hideDialog()
      false

    $("body").on "click", "#dialog [role='confirm']", ->
      $("#dialog .dialog-actions #dialog-trigger-original-link").click()

    $(window).on "resize", =>
      $("#dialog").absoluteCenter()

  @isVisible: () ->
    $("#dialog").hasClass("visible")

  @showDialog: () ->
    window.layout.showOverlay()
    Menus.hideMenus()
    $("#dialog").absoluteCenter().addClass("visible")

  @hideDialog: () ->
    $("#dialog").removeClass("visible")
    if window.layout.isVisible()
      window.layout.hideOverlay()
