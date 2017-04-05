class App.MD.Datepicker
  @init: () ->
    # TODO DEPRECATE: use data-behavior below
    $.map $("[role='datepicker']"), (element, index) ->
      new App.MD.Datepicker(element)

    $.map $("[data-behavior='datepicker']"), (element, index) ->
      new App.MD.Datepicker(element)

  constructor: (element, options = {}) ->
    @$element = $(element)

    # Do not re-run on elements that already have datepickers
    if @$element.attr("data-has-datepicker") == "true"
      return
    else
      @options = $.extend({}, @defaultOptions(), options)
      @init()

  init: () ->
    @$element.pikaday(@options)
    @$element.attr("data-has-datepicker", true)

  defaultOptions: () ->
    {
      format: "MM/DD/YYYY",
      bound: true,
      keyboardInput: false,
    }
