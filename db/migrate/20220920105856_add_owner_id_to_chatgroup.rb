class AddOwnerIdToChatgroup < ActiveRecord::Migration[6.1]
  def change
    add_column :chatgroups, :owner_id, :integer
  end
end
