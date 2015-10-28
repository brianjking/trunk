ready = ->
  $('.hamburger').click ->
    $('.sidebar').toggleClass('open')

$(document).ready(ready)
$(document).on('page:load', ready)
