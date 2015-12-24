json.id note.id
json.title note.title
json.content(note.content.to_s) if local_assigns.has_key?(:show_content) && show_content
json.pinned note.pinned
json.created_at note.created_at
json.updated_at note.updated_at
