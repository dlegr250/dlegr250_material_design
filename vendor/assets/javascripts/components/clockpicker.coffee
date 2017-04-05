class App.MD.Clockpicker
  @init: () ->
    # TODO DEPRECATE
    $.map $("[role='clockpicker']"), (element, index) ->
      new App.MD.Clockpicker(element)

    $.map $("[data-behavior='clockpicker']"), (element, index) ->
      new App.MD.Clockpicker(element)

  constructor: (element, options = {}) ->
    @$element = $(element)

    # Do not re-run on elements that already have clockpickers
    if @$element.attr("data-has-clockpicker") == "true"
      return
    else
      @options = $.extend({}, @defaultOptions(), options)
      @init()

  init: () ->
    @$element.clockpicker(@options)
    @$element.attr("data-has-clockpicker", true)

  defaultOptions: () ->
    {
      donetext: "Select",
      twelvehour: true,
      autoclose: false,
      placement: "bottom",
      align: "left",
    }
