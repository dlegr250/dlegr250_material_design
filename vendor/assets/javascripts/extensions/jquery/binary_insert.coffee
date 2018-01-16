jQuery.extend jQuery.fn,
  binaryInsert: (element) ->
    @each ->
      $list = $(this)

      $children = $list.children()

      $childrenWithValues = $children.filter (i) ->
        return !!$(this).attr("data-sort")

      $childrenValues = $childrenWithValues.map (i, e) ->
        $(e).attr("data-sort")

      listLength = $children.length

      # New element to insert
      $element = $(element)
      elementValue = $element.attr("data-sort")

      # Edge cases for optimizations
      #----------------------------------------------------------------------

      # Empty list, make new element first one
      if listLength <= 0
        console.log "list empty"
        $list.append($element)
        return

      # New element does not have a sortable value, add to the bottom
      if elementValue == null || elementValue == "" # || isNaN(elementValue)
        console.log "element empty"
        $list.append($element)
        return

      # List does not have any items with values, so prepend
      if $childrenWithValues.length == 0
        console.log "list does not have any values"
        $list.append($element)
        return

      # Less than start element, so prepend to list
      if elementValue < $childrenValues[0]
        console.log "Element < first"
        $list.prepend($element)
        return

      # Greater than last element, append to list
      if elementValue > $childrenValues[listLength - 1]
        console.log "element > last"
        $list.append($element)
        return

      startIndex = 0
      endIndex = $childrenWithValues.length - 1
      middleIndex = startIndex + Math.floor((endIndex - startIndex) / 2)

      # Actual binary search algorithm
      #----------------------------------------------------------------------

      while startIndex <= endIndex
        middleIndex = startIndex + Math.floor((endIndex - startIndex) / 2)

        if elementValue < $childrenValues[middleIndex]
          endIndex = middleIndex - 1
          console.log "#{elementValue} < #{$childrenValues[middleIndex]}"
          console.log "endIndex: #{endIndex}"
          continue

        startIndex = middleIndex + 1
        console.log "startIndex: #{startIndex}"
        if $childrenValues[middleIndex] == elementValue
          break

      console.log "insert before: #{startIndex}"
      $children.eq(startIndex).before($element)
