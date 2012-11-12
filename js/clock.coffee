class @Clock
  @start: ->
    activate(digits.es)

  activate = (digit) ->
    $(digit).addClass("active")

  createSelector = (coordinates) ->
    s = ""
    s += ".clock tr:nth-child(#{c[1]}) td:nth-child(#{c[0]}), " for c in coordinates
    s.substr(0, s.length - 2)

  digits =
    es: createSelector([[1,1], [2,1]])
    ist: createSelector([[4,1], [5,1], [6,1]])

    m_fuenf: createSelector([[8,1], [9,1], [10,1], [11,1]])
    m_zehn: createSelector([[1,2], [2,2], [3,2], [4,2]])
    m_fuenfzehn: createSelector([[8,1], [9,1], [10,1], [11,1], [1,2], [2,2], [3,2], [4,2]])
    m_zwanzig: createSelector([[5,2], [6,2], [7,2], [8,2], [9,2], [10,2], [11,2]])

    m_dreiviertel: createSelector([[1,3], [2,3], [3,3], [4,3], [5,3], [6,3], [7,3], [8,3], [9,3], [10,3], [11,3]])
    m_viertel: createSelector([[5,3], [6,3], [7,3], [8,3], [9,3], [10,3], [11,3]])

    nach: createSelector([[3,4], [4,4], [5,4], [6,4]])
    vor: createSelector([[7,4], [8,4], [9,4]])

    halb: createSelector([[1,5], [2,5], [3,5], [4,5]])

    h_zwoelf: createSelector([[6,5], [7,5], [8,5], [9,5], [10,5]])

    h_zwei: createSelector([[1,6], [2,6], [3,6], [4,6]])
    h_eins: createSelector([[3,6], [4,6], [5,6], [6,6]])
    h_sieben: createSelector([[6,6], [7,6], [8,6], [9,6], [10,6], [11,6]])

    h_drei: createSelector([[2,7], [3,7], [4,7], [5,7]])
    h_fuenf: createSelector([[8,7], [9,7], [10,7], [11,7]])

    h_elf: createSelector([[1,8], [2,8], [3,8]])
    h_neun: createSelector([[4,8], [5,8], [6,8], [7,8]])
    h_vier: createSelector([[8,8], [9,8], [10,8], [11,8]])

    h_acht: createSelector([[2,9], [3,9], [4,9], [5,9]])
    h_zehn: createSelector([[6,9], [7,9], [8,9], [9,9]])

    h_sechs: createSelector([[2,10], [3,10], [4,10], [5,10], [6,10]])

    uhr: createSelector([[9,10], [10,10], [11,10]])

