#======================================================================
# Code executed always for entire application.
#======================================================================
$(document).on "page:fetch", ->
  $("#main").html("<div class='spinner' id='main-spinner'></div>")

$(document).on "ready page:load", ->
  # Galleria slider
  if $(".galleria").length
    $(".galleria").galleria({
      idleMode: false,
      showInfo: false,
      swipe: "enforced"
    })

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
