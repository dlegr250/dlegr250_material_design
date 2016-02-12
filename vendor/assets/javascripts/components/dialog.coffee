#======================================================================
# Manage dialogs (aka modals). Builds upon Layout class.
#======================================================================
class Dlegr250MaterialDesign.Dialog
  constructor: () ->
    @setEvents()

  setEvents: () ->
    $("body").on "click", "a[data-custom-confirm]", ->
      triggerLinkClone = $(this).clone().removeAttr("data-custom-confirm")
      triggerLinkClone.attr("id", "dialog-trigger-original-link")
      templateHtml = $("##{$(this).data('custom-confirm')['template']}").html()
      $("#dialog").html(templateHtml)
      $("#dialog").find(".dialog-actions").append(triggerLinkClone.hide())
      Dlegr250MaterialDesign.Dialog.showDialog()
      false

    $("#dialog").on "click", "[role='cancel']", ->
      Dlegr250MaterialDesign.Dialog.hideDialog()
      false

    $("#dialog").on "click", "[role='confirm']", ->
      $("#dialog").find("#dialog-trigger-original-link").click()
      Dlegr250MaterialDesign.Dialog.hideDialog()

    $(window).on "resize", ->
      $("#dialog").absoluteCenter()

  @isVisible: () ->
    $("#dialog").hasClass("visible")

  @showDialog: () ->
    Dlegr250MaterialDesign.Layout.showOverlay()
    Dlegr250MaterialDesign.Menus.hideMenus()
    $("#dialog").absoluteCenter().addClass("visible")

  @hideDialog: () ->
    $("#dialog").removeClass("visible")
    if Dlegr250MaterialDesign.Layout.isOverlayVisible()
      Dlegr250MaterialDesign.Layout.hideOverlay()
