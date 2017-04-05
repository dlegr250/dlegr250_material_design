class App.MD.HtmlEditor
  constructor: (element, options = {}) ->
    @$element = $(element)
    @format = options["format"] || "simple"
    @templateVariables = options["templateVariables"] || false

    if @format == "full"
      @options = $.extend({}, @defaultFullSettings(), options)
    else if @format == "core"
      @options = $.extend({}, @defaultCoreSettings(), options)
    else
      @options = $.extend({}, @defaultSimpleSettings(), options)

    @init()

  init: () ->
    if @templateVariables
      @$element.on("froalaEditor.initialized", (e, editor) ->
        new App.AtWhoWithTemplateVariables(editor.$el)
        editor.events.on("keydown", (e) ->
          if (e.which == $.FroalaEditor.KEYCODE.ENTER && editor.$el.atwho("isSelecting"))
            return false
        , true)
      ).froalaEditor(@options)
    else
      @$element.froalaEditor(@options)

    if @options["focus"] == true || @$element.attr("autofocus")
      @$element.froalaEditor("events.focus")

  # Simple Settings
  #----------------------------------------------------------------------

  defaultCoreSettings: () ->
    {
      placeholderText: null,
      enter: 2, # $.FroalaEditor.ENTER_BR
      heightMin: 100,
      toolbarBottom: false,
      toolbarSticky: false,
      toolbarButtons: @coreToolbarButtons(),
      toolbarButtonsMD: @coreToolbarButtons(),
      toolbarButtonsSM: @coreToolbarButtons(),
      toolbarButtonsXS: @coreToolbarButtons(),
    }

  coreToolbarButtons: () ->
    [
      "bold", "italic", "underline", "|", "formatOL", "formatUL"
    ]

  defaultSimpleSettings: () ->
    {
      placeholderText: null,
      enter: 2, # $.FroalaEditor.ENTER_BR
      heightMin: 100,
      toolbarBottom: false,
      toolbarSticky: false,
      toolbarButtons: @simpleToolbarButtons(),
      toolbarButtonsMD: @simpleToolbarButtons(),
      toolbarButtonsSM: @simpleToolbarButtons(),
      toolbarButtonsXS: @simpleToolbarButtons(),
    }

  simpleToolbarButtons: () ->
    [
      "bold", "italic", "underline", "color",
      "|", "insertLink",
      "|", "formatOL", "formatUL", "outdent", "indent",
      "|", "clearFormatting"
    ]

  # Full Settings
  #----------------------------------------------------------------------

  defaultFullSettings: () ->
    {
      placeholderText: null,
      enter: 2, # $.FroalaEditor.ENTER_BR
      heightMin: 100,
      toolbarBottom: false,
      toolbarSticky: false,
      toolbarButtons: @fullToolbarButtons(),
      toolbarButtonsMD: @fullToolbarButtons(),
      toolbarButtonsSM: @fullToolbarButtons(),
      toolbarButtonsXS: @fullToolbarButtons(),
    }

  fullToolbarButtons: () ->
    [
      "fontSize", "|", "bold", "italic", "underline", "color",
      "|", "align", "formatOL", "formatUL", "outdent",
      "indent", "|", "insertLink", "|", "clearFormatting"
    ]
