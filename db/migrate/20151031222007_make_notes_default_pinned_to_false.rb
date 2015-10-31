class MakeNotesDefaultPinnedToFalse < ActiveRecord::Migration
  def change
    change_column :notes, :pinned, :boolean, default: false
  end
end
