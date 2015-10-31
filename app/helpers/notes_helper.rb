module NotesHelper
  def note_title(note)
    note.title.present? ? note.title : "Untitled Note"
  end

  def note_link_options(note)
    classes = [ "sidebar-item" ]
    classes << "active" if params[:id] && note.id.to_s == params[:id]
    classes << "pinned" if note.pinned

    data = { note_id: note.id }

    { class: classes.join(' '), data: data }
  end
end
