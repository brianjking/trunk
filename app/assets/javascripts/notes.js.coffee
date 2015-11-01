ready = ->
  if $('.content-body').length > 0
    # Set up markdown editor:
    textarea = $('.content-body textarea')[0]
    simplemde = new SimpleMDE({
      element: textarea,
      spellChecker: false,
      toolbar: SimpleMDE.toolbar.slice(0, SimpleMDE.toolbar.length - 5)
    })

    # Enable tab close warnings:
    $('form.edit_note').areYouSure()

$(document).ready(ready)
$(document).on('page:load', ready)
