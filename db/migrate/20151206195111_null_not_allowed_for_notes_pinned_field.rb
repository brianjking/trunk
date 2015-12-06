class NullNotAllowedForNotesPinnedField < ActiveRecord::Migration
  def change
    change_column_null(:notes, :pinned, false)
  end
end
