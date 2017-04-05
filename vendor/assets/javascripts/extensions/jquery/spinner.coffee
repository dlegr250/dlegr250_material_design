# Change content of element to be centered spinner
#----------------------------------------------------------------------

jQuery.extend jQuery.fn,
  replaceWithSpinner: (options = {}) ->
    color = options["color"] || "primary"
    size = options["size"] || "normal"

    @each ->
      element = $(this)
      spinner = $("<div class='spinner-container'><div class='spinner spinner-#{color} spinner-#{size}'></div></div>")
      element.html(spinner)
      element
