module NotesHelper
  def note_title(note)
    note.title.present? ? note.title : "Untitled Note"
  end
end
