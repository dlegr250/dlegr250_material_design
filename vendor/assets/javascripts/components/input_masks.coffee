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

    # Format: "[1-99]"
    $(":input[data-format='years']").autoNumeric("init", {
      vMin: "0",
      vMax: "99"
    })

    # Format: "[1-11]"
    # Do not let user put in 12 months because that is 1 year
    $(":input[data-format='months']").autoNumeric("init", {
      vMin: "0",
      vMax: "11"
    })

    # Format: "[1-168]" (24 hrs * 7 days = 168 max hours)
    $(":input[data-format='weekly-hours']").autoNumeric("init", {
      vMin: "0",
      vMax: "168",
    })

    # Format: "123 - 45 - 6789"
    $(":input[data-format='ssn']").inputmask("999 - 99 - 9999")

    # Format: "(123) 456 - 7890"
    $(":input[data-format='phone']").inputmask("(999) 999 - 9999")

    # Format: "12/1975"
    $(":input[data-format='date-my']").inputmask("mm/yyyy", { placeholder: "__/____" })

    # Format: "01/25/1947"
    $(":input[data-format='date-mdy']").inputmask("mm/dd/yyyy", { placeholder: "__/__/____" })

    # Format: "$ 999,999,999.99"
    $(":input[data-format='currency']").autoNumeric("init", {
      aSign: "$ ",
      aSep: ",",
      aDec: ".",
      vMin: "0",
      vMax: "999999999.99",
      dGroup: "3",
      aPad: true # Pad decimals with 0's
    })

    # Format (allow negatives): "$ 999,999,999.99"
    $(":input[data-format='currency-allow-negative']").autoNumeric("init", {
      aSign: "$ ",
      aSep: ",",
      aDec: ".",
      vMin: "-999999999.99",
      vMax: "999999999.99",
      dGroup: "3",
      aPad: true # Pad decimals with 0's
    })

    # Default "$" placeholder for currency fields if no placeholder specified
    $(":input[data-format='currency']").not("[placeholder]").attr("placeholder", "$")

    # Format: "1.234"
    # $(":input[data-format='percentage']").autoNumeric("init", {
    #   vMin: "0",
    #   vMax: "99.999",
    #   aPad: true
    # })
    $(":input[data-format='percentage']").autoNumeric("init", {
      aSign: " %",
      pSign: "s",
      vMin: "0",
      vMax: "99.999",
      aPad: true
    })

    $(":input[data-format='percentage-allow-negative']").autoNumeric("init", {
      aSign: " %",
      pSign: "s",
      vMin: "-99.999",
      vMax: "99.999",
      aPad: true
    })

    # Default "%" placeholder for percentage fields if no placeholder specified
    $(":input[data-format='percentage']").not("[placeholder]").attr("placeholder", "%")

    # Format: "123,456"
    $(":input[data-format='numerical']").autoNumeric("init", {
      vMin: "0",
      vMax: "999999999",
      aPad: false
    })
