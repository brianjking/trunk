ready = ->
  if $('.content-body').length > 0
    textarea = $('.content-body textarea')[0]
    
    simplemde = new SimpleMDE({
      element: textarea,
      spellChecker: false,
      toolbar: SimpleMDE.toolbar.slice(0, SimpleMDE.toolbar.length - 5)
    })

$(document).ready(ready)
$(document).on('page:load', ready)
