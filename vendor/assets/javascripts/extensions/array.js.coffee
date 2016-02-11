#======================================================================
# Extensions to the base Array class for CoffeeScript.
# See: http://stackoverflow.com/questions/4825812/clean-way-to-remove-element-from-javascript-array-with-jquery-coffeescript
#======================================================================
Array::remove = (e) -> @[t..t] = [] if (t = @indexOf(e)) > -1
