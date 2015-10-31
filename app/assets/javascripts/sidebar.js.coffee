ready = ->
  $('.hamburger').unbind().click ->
    $('.sidebar').toggleClass('open')

  $('.pin').unbind().click ->
    sidebarItem = $(this).closest('.sidebar-item')
    note_id = sidebarItem.data('note-id')
    return console.error "Note ID could not be found" unless note_id

    url = "/notes/#{note_id}"
    data = {
      '_method': 'patch',
      note: {
        pinned: !sidebarItem.hasClass("pinned")
      }
    }

    $.post url, data, ->
      console.log "Pinned"

$(document).ready(ready)
$(document).on('page:load', ready)
