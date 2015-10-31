class AddPinnedStatusToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :pinned, :boolean
    add_index :notes, :pinned
  end
end
