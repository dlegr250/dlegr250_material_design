#======================================================================
# Input masks for form text elements.
#======================================================================
class App.MD.InputMasks
  @init: () ->
    @setVariables()
    @setEvents()

  @setVariables: () ->

  @setEvents: () ->
    # Input masks
    Inputmask.extendDefaults({
      showMaskOnHover: false
    })

    $(":input").inputmask()

    # Format: "[1-99]"
    $(":input[data-mask='years']").inputmask("9[9]", {
      placeholder: "",
      greedy: false
    })

    # Format: "[1-11]"
    # Do not let user put in 12 months because that is 1 year
    $(":input[data-mask='months']").inputmask("Regex", {
      regex: "[1-9]|1[0-1]"
    })

    # Format: "[1-168]" (24 hrs * 7 days = 168 max hours)
    $(":input[data-mask='hours']").inputmask("Regex", {
      regex: "[0-9][0-9]|1[0-5][0-9]|16[0-8]"
    })

    # Format: "123 - 45 - 6789"
    $(":input[data-mask='ssn']").inputmask("999 - 99 - 9999")

    # Format: "(123) 456 - 7890"
    $(":input[data-mask='phone']").inputmask("(999) 999 - 9999")

    # Format: "12/1975"
    $(":input[data-mask='date-my']").inputmask("mm/yyyy", { placeholder: "__/____" })

    # Format: "01/25/1947"
    $(":input[data-mask='date-mdy']").inputmask("mm/dd/yyyy", { placeholder: "__/__/____" })

    # Format: "$ 123,456"
    $(":input[data-mask='currency']").inputmask("currency", {
      rightAlign: false,
      greedy: true,
      placeholder: "",
      digits: 0,
      allowPlus: false,
      allowMinus: false,
      prefix: "$ ",
      min: 0
    })
