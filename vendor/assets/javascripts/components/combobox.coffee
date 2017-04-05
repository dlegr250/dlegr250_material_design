class App.MD.Combobox
  @init: () ->
    $.map $("[role='combobox']"), (element, index) ->
      new App.MD.Combobox(element)

    $.map $("[data-behavior='combobox']"), (element, index) ->
      new App.MD.Combobox(element)

  constructor: (element, options = {}) ->
    @$element = $(element)

    if @$element.attr("data-has-combobox") == "true"
      return
    else
      @options = $.extend({}, @defaultOptions(), options)
      @init()

  init: () ->
    @$element.select2(@options)
    @$element.attr("data-has-combobox", true)

  defaultOptions: () ->
    {
      placeholder: null,
      allowClear: true,
      minimumResultsForSearch: Infinity,
      maximumSelectionLength: 1
    }
