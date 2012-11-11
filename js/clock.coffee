createSelector = (coordinates) ->
  s = ""
  s += ".clock tr:nth-child(#{c[1]}) td:nth-child(#{c[0]}), " for c in coordinates
  s.substr(0, s.length - 2)

_es = createSelector([[1,1], [2,1]])
_ist = createSelector([[4,1], [5,1], [6,1]])
_fuenf = createSelector([[8,1], [9,1], [10,1], [11,1]])

console.log _es

@clock =
  start: () ->
    $(_es).addClass("active");
    $(_ist).addClass("active");
    $(_fuenf).addClass("active");

