class AddUserIdFieldToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :user_id, :integer, index: true
  end
end
