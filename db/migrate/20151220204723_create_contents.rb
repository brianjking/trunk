class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :note_id
      t.text :text_content
      t.string :content_type

      t.timestamps
    end
  end
end
