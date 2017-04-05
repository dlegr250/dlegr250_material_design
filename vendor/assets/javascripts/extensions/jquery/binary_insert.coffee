jQuery.extend jQuery.fn,
  binaryInsert: (element) ->
    @each ->
      $list = $(this)

      # Remove any elements that have a blank sort attribute
      # See: http://stackoverflow.com/a/8127904/667772
      $collection = $list.children().filter ->
        return !!$(this).attr("data-sort")

      # Pre-fetch values to compare
      $collectionValues = $collection.map ->
        $(this).attr("data-sort")

      # New element to insert
      $element = $(element)
      elementValue = $element.attr("data-sort")

      collectionLength = $collection.length
      startIndex = 0
      endIndex = collectionLength - 1
      middleIndex = startIndex + Math.floor((endIndex - startIndex) / 2)

      # Edge cases for optimizations
      #----------------------------------------------------------------------

      # Empty list, make new element first one
      if collectionLength <= 0
        $list.append($element)
        return

      # New element does not have a sortable value, add to the bottom
      if elementValue == null || elementValue == "" || isNaN(elementValue)
        $list.append($element)
        return

      # Less than start element, so prepend to collection
      if elementValue <= $collection.first().attr("data-sort")
        $list.prepend($element)
        return

      # Greater than last element, so append to collection
      if elementValue >= $collection.last().attr("data-sort")
        $list.append($element)
        return

      # Actual binary search algorithm
      #----------------------------------------------------------------------

      while startIndex <= endIndex
        middleIndex = startIndex + Math.floor((endIndex - startIndex) / 2)

        if $collectionValues[middleIndex] > elementValue
          endIndex = middleIndex - 1
          continue

        startIndex = middleIndex + 1
        if $collectionValues[middleIndex] == elementValue
          break

      $collection.eq(startIndex).before($element)
