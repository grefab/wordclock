class @Clock
  ui_digits = {}
  ui_dots = {}

  @start: ->
    init_ui()
    mainLoop()

  mainLoop = ->
    displayTime()
    setTimeout(mainLoop, 500)

  getTime = ->
    d = new Date()
    hours = d.getHours()
    hours = if hours > 12 then hours - 12 else hours
    hours = if hours == 0 then 12 else hours
    minutes = d.getMinutes()
    dots = minutes % 5
    [hours, minutes, dots]

  displayHours = (hours, minutes) ->
    d_hours = if minutes < 25 then hours else hours + 1
    d_hours = if d_hours == 13 then 1 else d_hours
    switch d_hours
      when 1
        if minutes < 5 then activate(ui_digits.$h_ein) else activate(ui_digits.$h_eins)
      when 2 then activate(ui_digits.$h_zwei)
      when 3 then activate(ui_digits.$h_drei)
      when 4 then activate(ui_digits.$h_vier)
      when 5 then activate(ui_digits.$h_fuenf)
      when 6 then activate(ui_digits.$h_sechs)
      when 7 then activate(ui_digits.$h_sieben)
      when 8 then activate(ui_digits.$h_acht)
      when 9 then activate(ui_digits.$h_neun)
      when 10 then activate(ui_digits.$h_zehn)
      when 11 then activate(ui_digits.$h_elf)
      when 12 then activate(ui_digits.$h_zwoelf)

  displayMinutes = (minutes) ->
    fives = Math.floor(minutes / 5)
    switch fives
      when 0
        activate(ui_digits.$uhr)
      when 1
        activate(ui_digits.$m_fuenf)
        activate(ui_digits.$nach)
      when 2
        activate(ui_digits.$m_zehn)
        activate(ui_digits.$nach)
      when 3
        activate(ui_digits.$m_viertel)
        activate(ui_digits.$nach)
      when 4
        activate(ui_digits.$m_zwanzig)
        activate(ui_digits.$nach)
      when 5
        activate(ui_digits.$m_fuenf)
        activate(ui_digits.$vor)
        activate(ui_digits.$halb)
      when 6
        activate(ui_digits.$halb)
      when 7
        activate(ui_digits.$m_fuenf)
        activate(ui_digits.$nach)
        activate(ui_digits.$halb)
      when 8
        activate(ui_digits.$m_zwanzig)
        activate(ui_digits.$vor)
      when 9
        activate(ui_digits.$m_viertel)
        activate(ui_digits.$vor)
      when 10
        activate(ui_digits.$m_zehn)
        activate(ui_digits.$vor)
      when 11
        activate(ui_digits.$m_fuenf)
        activate(ui_digits.$vor)

  displayDots = (displayDots) ->
    if displayDots > 0 then activate(ui_dots.$one)
    if displayDots > 1 then activate(ui_dots.$two)
    if displayDots > 2 then activate(ui_dots.$three)
    if displayDots > 3 then activate(ui_dots.$four)

  lastTime = [-1, -1, -1]

  arrayEqual = (a, b) ->
    a.length is b.length and a.every (elem, i) -> elem is b[i]

  $activateMe = $()

  displayTime = ->
    currentTime = getTime()
    unless arrayEqual(lastTime, currentTime)
      lastTime = currentTime

      $activateMe = $()

      activate(ui_digits.$es)
      activate(ui_digits.$ist)
      [hours, minutes, dots] = currentTime
      displayHours(hours, minutes)
      displayMinutes(minutes)
      displayDots(dots)

      $activateMe.addClass("active")
      ui_digits.$all.not($activateMe).removeClass("active")

  activate = ($element) ->
    $activateMe = $activateMe.add($element)

  createSelector = (coordinates) ->
    s = ""
    s += ".clock .grid tr:nth-child(#{c[1]}) td:nth-child(#{c[0]}), " for c in coordinates
    s.substr(0, s.length - 2)

  init_ui = ->
    ui_digits.$all = $(".clock .grid td, .clock .dots")

    ui_digits.$es = $(createSelector([[1,1], [2,1]]))
    ui_digits.$ist = $(createSelector([[4,1], [5,1], [6,1]]))

    ui_digits.$m_fuenf = $(createSelector([[8,1], [9,1], [10,1], [11,1]]))
    ui_digits.$m_zehn = $(createSelector([[1,2], [2,2], [3,2], [4,2]]))
    ui_digits.$m_fuenfzehn = $(createSelector([[8,1], [9,1], [10,1], [11,1], [1,2], [2,2], [3,2], [4,2]]))
    ui_digits.$m_zwanzig = $(createSelector([[5,2], [6,2], [7,2], [8,2], [9,2], [10,2], [11,2]]))

    ui_digits.$m_dreiviertel = $(createSelector([[1,3], [2,3], [3,3], [4,3], [5,3], [6,3], [7,3], [8,3], [9,3], [10,3], [11,3]]))
    ui_digits.$m_viertel = $(createSelector([[5,3], [6,3], [7,3], [8,3], [9,3], [10,3], [11,3]]))

    ui_digits.$nach = $(createSelector([[3,4], [4,4], [5,4], [6,4]]))
    ui_digits.$vor = $(createSelector([[7,4], [8,4], [9,4]]))

    ui_digits.$halb = $(createSelector([[1,5], [2,5], [3,5], [4,5]]))

    ui_digits.$h_zwoelf = $(createSelector([[6,5], [7,5], [8,5], [9,5], [10,5]]))

    ui_digits.$h_zwei = $(createSelector([[1,6], [2,6], [3,6], [4,6]]))
    ui_digits.$h_ein = $(createSelector([[3,6], [4,6], [5,6]]))
    ui_digits.$h_eins = $(createSelector([[3,6], [4,6], [5,6], [6,6]]))
    ui_digits.$h_sieben = $(createSelector([[6,6], [7,6], [8,6], [9,6], [10,6], [11,6]]))

    ui_digits.$h_drei = $(createSelector([[2,7], [3,7], [4,7], [5,7]]))
    ui_digits.$h_fuenf = $(createSelector([[8,7], [9,7], [10,7], [11,7]]))

    ui_digits.$h_elf = $(createSelector([[1,8], [2,8], [3,8]]))
    ui_digits.$h_neun = $(createSelector([[4,8], [5,8], [6,8], [7,8]]))
    ui_digits.$h_vier = $(createSelector([[8,8], [9,8], [10,8], [11,8]]))

    ui_digits.$h_acht = $(createSelector([[2,9], [3,9], [4,9], [5,9]]))
    ui_digits.$h_zehn = $(createSelector([[6,9], [7,9], [8,9], [9,9]]))

    ui_digits.$h_sechs = $(createSelector([[2,10], [3,10], [4,10], [5,10], [6,10]]))

    ui_digits.$uhr = $(createSelector([[9,10], [10,10], [11,10]]))

    ui_dots.$one = $(".clock .dots.one")
    ui_dots.$two = $(".clock .dots.two")
    ui_dots.$three = $(".clock .dots.three")
    ui_dots.$four = $(".clock .dots.four")
