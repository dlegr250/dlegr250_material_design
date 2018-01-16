window.App.MD ||= {}

class App.MD.ExpansionPanel
  @init: () ->
    $(document).off("click", "[data-behavior='expansion-panel-toggle']").on "click", "[data-behavior='expansion-panel-toggle']", (e) ->
      $panel = $(this).closest("[data-behavior='expansion-panel']")
      $details = $panel.find("[data-behavior='expansion-panel-details']")
      $editor = $details.find("[role~='html-editor']")

      if $panel.attr("data-state") == "expanded"
        $panel.attr("data-state", "collapsed")
      else
        $panel.attr("data-state", "expanded")
        $details.find("input[autofocus]").focus()
        # $editor.froalaEditor("events.focus") if $editor.length > 0
