ready = ->
  setTimeout ->
    $('.flash-message').fadeOut('slow')
  , 5000


$(document).ready(ready)
$(document).on('page:load', ready)
