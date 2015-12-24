class MigrateNoteContentToContentModels < ActiveRecord::Migration
  def change
    add_column :notes, :content_id, :integer

    Note.all.each do |note|
      content = Content.create(
        note_id: note.id,
        text_content: note.content,
        content_type: 'text'
      )

      note.update_attribute(:content_id, content.id)
    end

    remove_column :notes, :content
  end
end
