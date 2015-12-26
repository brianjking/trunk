renderFields = ->
  # Parse fields:
  fields = $('#contact_fields').val() || JSON.stringify({ home: "", phone: "", email: "" })
  fields = JSON.parse(fields)

  # Render each field:
  $('#fields_wrapper').html(HandlebarsTemplates['contact_fields']({
    fields: fields
  }))

writeContactFieldsToInput = ->
  console.log "foo"

$ ->
  $(document).on 'click', '.contact-button-remove', (e) ->
    e.preventDefault()
    $(this).parent().remove()
    writeContactFieldsToInput()

  $(document).on 'click', '.contact-button-add', (e) ->
    e.preventDefault()


  $(document).on 'keyup', '.contact-field input', (e) ->
    e.preventDefault()
    writeContactFieldsToInput()

ready = ->
  if $('#contact_fields').length > 0
    renderFields()

$(document).ready(ready)
$(document).on('page:load', ready)
