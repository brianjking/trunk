ready = ->
  if $('.content-body').length > 0
    # Set up markdown editor:
    textarea = $('.content-body textarea')[0]
    simplemde = new SimpleMDE({
      autoDownloadFontAwesome: false,
      element: textarea,
      spellChecker: false,
      toolbar: SimpleMDE.toolbar.slice(0, SimpleMDE.toolbar.length - 5),
      autofocus: true
    })

    # Save any changes to the textarea (this is for the tab close warnings):
    simplemde.codemirror.on 'change', ->
      simplemde.element.textContent = simplemde.value()

    # Enable tab close warnings:
    $('form.edit_note').areYouSure()

    # Disable hotkey input protection:
    jQuery.hotkeys.options.filterInputAcceptingElements = false
    jQuery.hotkeys.options.filterContentEditable = false
    jQuery.hotkeys.options.filterTextInputs = false

    # Enable ctrl/cmd+s for saving:
    $(document).bind 'keydown', 'ctrl+s meta+s', (e) ->
      e.preventDefault()
      $('form.edit_note').submit()

$(document).ready(ready)
$(document).on('page:load', ready)
