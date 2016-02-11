#======================================================================
# Code executed always for entire application.
# Filename is namespaced to avoid conflict with application naming.
#======================================================================

# Leaving a current page
#----------------------------------------------------------------------

$(document).on "page:fetch", ->
  $("#main").html("<div class='spinner' id='main-spinner'></div>")

# New page is loaded
#----------------------------------------------------------------------

$(document).on "ready page:load", ->
  # TODO use a global App variable instead of window

  # Attach to global window object
  window.layout = new Layout()
  window.menus = new Menus()
  window.tabs = new Tabs()
  window.dialogs = new Dialogs()
  window.form_operations = new FormOperations()
  window.testimonialFileUploader = new TestimonialFileUploader({
    dropzone: "#new-testimonial-dropzone",
    file_field: "#testimonial_image",
    post_url: "post_url..."
  })
