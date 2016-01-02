renderFields = ->
  # Parse fields:
  fields = $('#contact_fields').val() || JSON.stringify({ home: "", phone: "", email: "" })
  fields = JSON.parse(fields)

  # Add empty field:
  fields["test"] = "foo"

  for a, b in fields
    console.log "here"

    $('#fields_wrapper').append(HandlebarsTemplates['contact_field']({
      key: "foo",
      value: "bar"
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
